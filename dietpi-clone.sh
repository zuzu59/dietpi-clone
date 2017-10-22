#!/bin/bash
# petit script pour cloner une carte SD DietPi sur une autre, mais plus petite
#zf171022.2248

#source: https://github.com/billw2/rpi-clone

zSD="/dev/sda"
zSD1=$zSD"1"
zSD2=$zSD"2"

#:<<'zdebug'


#démonte la nouvelle SD
umount $zSD1
umount $zSD2
sleep 1

#efface toute les partition de la nouvelle SD
(echo d; echo ; echo d; echo ; echo d; echo ; echo w) | fdisk $zSD
sleep 1

#crée les partions de la nouvelle SD et les formates
(echo n; echo p; echo 1; echo ; echo +100M; echo w) | fdisk $zSD
(echo n; echo p; echo 2; echo ; echo +3.7G; echo w) | fdisk $zSD
#change le type à FAT16 de la SD1
(echo t; echo 1; echo e; echo w) | fdisk $zSD
#rend bootable la SD1
(echo a; echo 1; echo w) | fdisk $zSD
sleep 1
mkfs -t vfat $zSD1
(echo y) | mkfs -t ext4 $zSD2
sleep 1

#copie la partion 2 sur la nouvelle SD
mkdir /mnt/clone
mount $zSD2 /mnt/clone
rsync --progress --force -rltWDEHXAgoptx --delete --exclude /var/swap --exclude .gvfs --exclude '/dev/*' --exclude '/mnt/clone/*' --exclude '/proc/*' --exclude '/run/*' --exclude '/sys/*' --exclude '/tmp/*' --exclude 'lost\+found/*' // /mnt/clone
sleep 1

#copie la partion 21 sur la nouvelle SD
mkdir /mnt/clone/boot
mount $zSD1 /mnt/clone/boot
rsync --progress --force -rltWDEHXAgoptx --delete --exclude .gvfs --exclude 'lost\+found/*' /boot/ /mnt/clone/boot
sleep 1



#zdebug



zUUID=`blkid |grep $zSD2 | awk '{print $2}' | sed 's/\"//g'`
echo $zUUID

cat /mnt/clone/boot/armbianEnv.txt |grep rootdev=
sed -i -E "s/rootdev=.+/rootdev=$zUUID/" /mnt/clone/boot/armbianEnv.txt
cat /mnt/clone/boot/armbianEnv.txt |grep rootdev=


#démonte la nouvelle SD
sync
sync
sync
sleep 1
umount $zSD1
umount $zSD2

