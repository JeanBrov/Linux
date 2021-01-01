#!/usr/bin/env bash
##### Making an Amazon EBS volume available for use on Linux #############
##### https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html #########
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

## Automatically mount an attached volume after reboot ##
# Create backup of your /etc/fstab file that you can use if you accidently destroy or delete this file when you are editing it.
sudo cp /etc/fstab /etc/fstab.origin
# Open the /etc/fstab file using any text editor, such as nano or vim.
sudo vim /etc/fstab

# Add a new line to the end of the file for your volume using the following format:
# device_name mount_point file_system_type defaults,nofail  0  2
# /dev/xvdb /data ext4 defaults,nofail  0  2

# validate
sudo file -s /dev/xvdb
sudo umount /data
lsblk
sudo mount -a