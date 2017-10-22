# dietpi-clone
Petit script pour un OrangePi zero pour cloner la carte SD DietPi sur une autre, mais de taille plus petite (4GB) afin de pouvoir en faire une image avec un dd (si on a une carte SD de 32GB c'est trop long).


# Installation
Sur l'OrangePi il faut faire:

```
cd
apt-get update
apt-get -y install git rsync
git clone https://github.com/zuzu59/dietpi-clone.git 
```


# Utilisation
Il faut mettre la nouvelle carte SD dans l'adaptateur SD/USB puis dans le port USB du OrangePi zero avant. Et on part du principe qu'elle sera en /dev/sda !

```
cd dietpi-clone
./dietpi-clone.sh
```

Cela prend moins de 3 minutes pour le clonage !


# Références

https://github.com/billw2/rpi-clone

https://doc.ubuntu-fr.org/dd

