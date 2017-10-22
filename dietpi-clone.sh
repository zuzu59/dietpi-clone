#!/bin/bash
# petit script pour cloner une carte SD DietPi sur une autre, mais plus petite
#zf171022.2113

#source: https://github.com/billw2/rpi-clone


zUUID=`cat /boot/armbianEnv.txt |grep rootdev`
echo $zUUID

cat /mnt/clone/boot/armbianEnv.txt

sed -i -E "s/rootdev=UUID=.+/$zUUID/" /mnt/clone/boot/armbianEnv.txt

cat /mnt/clone/boot/armbianEnv.txt


