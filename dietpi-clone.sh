#!/bin/bash
# petit script pour cloner une carte SD DietPi sur une autre, mais plus petite
#zf171022.2113

#source: https://github.com/billw2/rpi-clone



toto=`cat /mnt/clone/boot/armbianEnv.txt |grep rootdev`

echo $toto

