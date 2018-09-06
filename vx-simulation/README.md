# README

## Simulation Name Space

This simulation is meant to be run on multi-user machines!  To create a copy, you need to...

### Allocate a simu workspace manually

You do this by editing `/var/lib/simu-cache/workbenches`.  It will look like...
```
jrrivers@ranch-02:~$ cat /var/lib/simu-cache/workbenches 
0:/home/jrrivers/test
1:/home/radhika/openstack
2:available
3:available
4:available
5:available
6:available
7:available
8:available
9:available
```
just put the path to your simulation in one of the slots like...
```
jrrivers@ranch-02:~$ cat /var/lib/simu-cache/workbenches 
0:/home/jrrivers/test
1:/home/radhika/openstack
2:available
3:available
4:available
5:available
6:available
7:available
8:available
9:/home/jrrivers/cl-piat
```
### Modify the Vagrantfile to use your workspace

Edit `Vagrantfile` and change the line that says `wbid =` to point to your workbench; which would be `wbid = 9` from the previous example.

### Modify the prefix that libvirt uses to distinguish files

Again edit `Vagrantfile` and find the line that says `libvirt.default_prefix = ` and change it to include the same path that you put in `/var/lib/simu-cache/workbenches`, but... you need to drop the leading "/" and convert the other "/" to "_".  The new line in the example would be `libvirt.default_prefix = 'home_jrrivers_cl-piat'`.

