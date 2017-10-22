#!/bin/bash
# petit script pour cloner une carte SD DietPi sur une autre, mais plus petite
#zf171022.2113

#source: https://github.com/billw2/rpi-clone


#zUUID=`cat /boot/armbianEnv.txt |grep rootdev`
zUUID=`blkid |grep /dev/sda2 |awk '{print $2}'`
echo $zUUID

cat /mnt/clone/boot/armbianEnv.txt |grep rootdev=

sed -i -E "s/rootdev=.+/rootdev=$zUUID/" /mnt/clone/boot/armbianEnv.txt

cat /mnt/clone/boot/armbianEnv.txt |grep rootdev=


