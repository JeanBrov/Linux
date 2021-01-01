#!/usr/bin/env bash

# check attached volumes
lsblk
## Output example
#[ec2-user@ip-172-31-37-188 ~]$ lsblk
#NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
#xvda    202:0    0   8G  0 disk
#└─xvda1 202:1    0   8G  0 part /
#xvdb    202:16   0   2G  0 disk
# As you can see the main drive "xvda" has been mounted as "/" directory, while xvdb is not being mounted
# we will mount it
sudo file -s /dev/xvdb
# You will get output "/dev/xvdb: data" which means that the device has not file system and you should create it
sudo mkfs -t ext4 /dev/xvdb
# Now we have to mount this directory
# create data folder
sudo mkdir /data
sudo mount /dev/xvdb /data # Mounting data

