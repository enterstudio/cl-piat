#!/usr/bin/python3.5
import json
import yaml
import pynetbox
from pprint import pprint
import ipaddress

nb = pynetbox.api(
    #'http://deep.packet.ninja:3002',
    'http://netq-ts:32768',
    token='0123456789abcdef0123456789abcdefcumulus'
)


def main():
    group_vars = {}
    group_vars['node'] = {}
    gen_datastructure(group_vars)
    json_output(group_vars)
    yaml_output(group_vars)

def json_output(group_vars):
    with open('group_vars/all.json', 'w') as outfile:
        json.dump(group_vars, outfile)
    pprint(group_vars)

def yaml_output(group_vars):
    with open('all.yml', 'w') as outfile:
        yaml.dump(group_vars, outfile, default_flow_style=False)


def getdeviceobjects():
    return nb.dcim.devices.filter(status=1)


def getinterfaceobjects(switchname):
    return nb.dcim.interfaces.filter(device=switchname)

def getipobjects(interface_id):
    return nb.ipam.ip_addresses.filter(interface_id=interface_id)


def gen_datastructure(group_vars):
    switches = getdeviceobjects()
    for switch in switches:
        switch_name = switch.name
        switch_role = switch.device_role.slug
        switchinterfaces = getinterfaceobjects(switch_name)
        gen_main(switch, switch_role, group_vars)
        for switchinterface in switchinterfaces:
            interface_name = switchinterface.name
            interface_id = switchinterface.id
            interface_description = switchinterface.description
            switch_ips = getipobjects(interface_id)
            interface_mode = None
            if switchinterface.mode:
                switchinterface_mode = switchinterface.mode
                interface_mode = switchinterface_mode.label
            if switchinterface.form_factor:
                interface_type = switchinterface.form_factor.label

            interfaces_mlag(switch, switch_name, switchinterface, interface_name, interface_id, interface_mode,
                            group_vars)
            if ((interface_mode in ['Tagged', 'Access']) and (
                    interface_type not in ['Virtual']) or interface_description in ['bgp_underlay']):
                if interface_name not in ['peerlink.4094']:
                    interfaces_downlink(switch, switch_name, switchinterface, interface_name, interface_id, interface_mode,
                                    group_vars)
            if interface_name not in ['peerlink.4094', 'lo', 'clagd-vxlan-anycast-ip']:
                for ip in switch_ips:
                    if ip:
                        interface_irb(switch, switch_name, switchinterface, interface_name, interface_id,
                                      interface_mode, ip, group_vars)
            if interface_name in ['peerlink', 'peerlink.4094']:
                interface_peerlink(switch, switch_name, switchinterface, switch_ips, interface_name, interface_id,
                                   interface_mode, group_vars)
            if interface_name in ['lo', 'clagd-vxlan-anycast-ip']:
                interface_special(switch, switch_name, switchinterface, switch_ips, interface_name, interface_id, interface_mode, group_vars)
            if interface_description in ['bgp_underlay']:
                routing_underlay(switch, switch_name, interface_name, group_vars)

    return group_vars


def gen_main(switch, switch_role, group_vars):
    switch_name = switch.name
    if switch_role == 'leaf':
        if switch_name not in group_vars['node']:
            group_vars["node"][switch_name] = {"routing": {"bgp": {"underlay": {"asn": {}, "peers": []}}},
                                               "mlag": {"address": {}, "backup-ip": {}, "members": [], "peer-ip": {},
                                                        "sysmac": {}}, "overlay": {"irb": {}}, "ports": {}}
    if switch_role == 'spine':
        if switch_name not in group_vars['node']:
            group_vars["node"][switch_name] = {"routing": {"bgp": {"underlay": {"asn": {}, "peers": []}}}, "ports": {}}
    return group_vars


def interfaces_downlink(switch, switch_name, switchinterface, interface_name, interface_id, interface_mode, group_vars):
    if interface_name not in group_vars['node'][switch_name]['ports']:
        group_vars['node'][switch_name]['ports'][interface_name] = {}
        if interface_mode:
            group_vars['node'][switch_name]['ports'][interface_name]['mode'] = {}
            group_vars['node'][switch_name]['ports'][interface_name]['mode'] = interface_mode
    if interface_mode in ['Tagged']:
        interface_vlans = switchinterface.tagged_vlans
        for vlans in interface_vlans:
            vlanid = vlans['vid']
            if 'vlans' not in group_vars['node'][switch_name]['ports'][interface_name]:
                group_vars['node'][switch_name]['ports'][interface_name]['vlans'] = []
            group_vars['node'][switch_name]['ports'][interface_name]['vlans'].append(vlanid)
            if switchinterface.untagged_vlan is not None:
                pvid = switchinterface.untagged_vlan.vid
                group_vars['node'][switch_name]['ports'][interface_name]['pvid'] = pvid

    if interface_mode in ['Access']:
        interface_vlan = switchinterface.untagged_vlan.vid
        if 'vlan' not in group_vars['node'][switch_name]['ports'][interface_name]:
            group_vars['node'][switch_name]['ports'][interface_name]['vlan'] = {}
        group_vars['node'][switch_name]['ports'][interface_name]['vlan'] = int(interface_vlan)

    return group_vars


def interface_peerlink(switch, switch_name, switchinterface, switch_ips, interface_name, interface_id, interface_mode,
                       group_vars):
    interface_mac = switchinterface.mac_address
    if switch_ips:
        interface_ip = switch_ips[0]
        ip_custom = switch_ips[0].custom_fields
        clag_peer_ip = ip_custom['clag_peer_ip']
        clag_backup_ip = ip_custom['clag_backup_ip']
    if 'mlag' not in group_vars['node'][switch_name]:
        group_vars['node'][switch_name]['mlag'] = {'members': [], 'address': {}, 'peer-ip': {}, 'backup-ip': {},
                                                   'sysmac': {}}
    if interface_name in ['peerlink']:
        group_vars['node'][switch_name]['mlag']['sysmac'] = str(interface_mac)
    if interface_name in ['peerlink.4094']:
        group_vars['node'][switch_name]['mlag']['address'] = str(interface_ip)
        group_vars['node'][switch_name]['mlag']['peer-ip'] = str(clag_peer_ip)
        group_vars['node'][switch_name]['mlag']['backup-ip'] = str(clag_backup_ip)


def interfaces_mlag(switch, switch_name, switchinterface, interface_name, interface_id, interface_mode, group_vars):
    interface_lag = None
    if switchinterface.lag:
        interface_lag = switchinterface.lag

    if interface_lag:
        lag_parent = interface_lag.name
        if lag_parent not in ['peerlink']:
            if lag_parent not in group_vars['node'][switch_name]['ports']:
                group_vars['node'][switch_name]['ports'][lag_parent] = {}
            if 'members' not in lag_parent not in group_vars['node'][switch_name]['ports'][lag_parent]:
                group_vars['node'][switch_name]['ports'][lag_parent]['members'] = []

        if lag_parent in ['peerlink']:
            group_vars['node'][switch_name]['mlag']['members'].append(str(interface_name))
        else:
            group_vars['node'][switch_name]['ports'][lag_parent]['members'].append(str(interface_name))


def interface_special(switch, switch_name, switchinterface, switch_ips, interface_name, interface_id, interface_mode,
                      group_vars):
    interface_ip = str(switch_ips[0])
    if interface_name in ['clagd-vxlan-anycast-ip']:
        group_vars['node'][switch_name]['overlay']['anycast-ip'] = interface_ip
    elif interface_name in ['lo']:
        group_vars['node'][switch_name]['routing']['lo'] = interface_ip
    return group_vars


def interface_irb(switch, switch_name, switchinterface, interface_name, interface_id, interface_mode, ip, group_vars):
    if interface_name not in group_vars['node'][switch_name]['overlay']['irb']:
        group_vars['node'][switch_name]['overlay']['irb'][interface_name] = {}
    interface_vlan = switchinterface.untagged_vlan
    interface_ip = ip.address
    ipaddress_family = 'ipv' + str(ip.family)
    ipaddress_role = str(ip.role)
    prefix_obj = ipaddress.ip_interface(interface_ip)
    ipnetwork = prefix_obj.network
    if ipaddress_family not in group_vars['node'][switch_name]['overlay']['irb'][interface_name]:
        group_vars['node'][switch_name]['overlay']['irb'][interface_name][ipaddress_family] = {
            ipaddress_role: str(interface_ip)}
    else:
        group_vars['node'][switch_name]['overlay']['irb'][interface_name][ipaddress_family][ipaddress_role] = str(
            interface_ip)
    if ipaddress_family == 'ipv6':
        group_vars['node'][switch_name]['overlay']['irb'][interface_name][ipaddress_family]['prefix'] = str(ipnetwork)

    l2vni = switchinterface.untagged_vlan.vid
    vrf_name = str(ip.tenant.slug)
    l3vni = ip.vrf
    l3vni_id = l3vni.name
    group_vars['node'][switch_name]['overlay']['irb'][interface_name]['l2vni'] = l2vni
    group_vars['node'][switch_name]['overlay']['irb'][interface_name]['vrf'] = vrf_name
    group_vars['node'][switch_name]['overlay']['irb'][interface_name]['l3vni'] = int(l3vni_id)

    return group_vars


def routing_underlay(switch, switch_name, interface_name, group_vars):
    switch_asn = switch.custom_fields['ASN']
    # if switch_asn not in group_vars['node'][switch_name]['routing']['bgp']['underlay']['asn']:
    group_vars['node'][switch_name]['routing']['bgp']['underlay']['asn'] = switch_asn
    group_vars['node'][switch_name]['routing']['bgp']['underlay']['peers'].append(str(interface_name))

    return group_vars


main()
