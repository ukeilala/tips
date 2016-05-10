#!/bin/sh

wget http://odroid.us/odroid/users/osterluk/qemu-example/qemu-example.tgz
tar zxf qemu-example.tgz ./zImage
rm -f qemu-example.tgz
wget http://releases.linaro.org/archive/12.04/ubuntu/precise-images/developr/linaro-precise-developer-20120426-86.tar.gz
tar zxf linaro-precise-developer-20120426-86.tar.gz
rm -f linaro-precise-developer-20120426-86.tar.gz
qemu-img create -f raw rootfs.img 3G
mkfs.ext3 rootfs.img
mkdir mnt
mount -o loop rootfs.img mnt
rsync -a binary/boot/filesystem.dir/ mnt/
umount mnt
rm -rf binary

qemu-system-arm -M vexpress-a9 -m 512 -kernel zImage -sd rootfs.img -append "root=/dev/mmcblk0 rw physmap.enabled=0 console=ttyAMA0" -net nic -net user,hostfwd=tcp:0.0.0.0:2222-10.0.2.15:22 -nographic

#after booting, network didn't set eth0. so you can apply it as below.

#in target, 
$ passwd root
$ ifconfig eth0 up
$ dhclient eth0 
$ apt-get install openssh-server

#in host,
$ ssh -p2222 root@localhost
#if it has any problem, you can add 'sudo' command.
#and you can set it as below
$ ssh-keygen -f "/root/.ssh/known_hosts" -R [localhost]:2222

#and you can use sshfs
$ sudo sshfs -p 2222 root@localhost:/home/mk /mnt/test -o nonempty
