# dietpi-clone
Petit script pour cloner la carte FLASH SD DietPi sur une autre avec un OrangePi zero.<br><br>
**Attention:**<br>
Ce n'est pas une copie *dd* car cela obligerait d'avoir comme carte FLASH SD de destination de taille équivalente, de plus les 32GB étant très bon marchées il faudrait faire un *dd* de 32GB, beaucoup trop long.<br>
La carte FLASH SD de destination est partitionnée, formatée et les données sont copiées dessus avec un *rsync*. Cela permet de cloner sur une destination plus petite que l'origine et surtout de pouvoir cloner à haute vitesse, moins de 3 minutes sur un OrangePi zero !<br>
Comme la carte FLASH SD est formatée, elle a un UUID différent que la carte d'origine, le fichier /boot/armbianEnv.txt est donc mis à jour avec le nouvel UUID. Nous avons donc un vrai clone de FLASH SD avec un UUDI différent !<br>
<br>
**Remarque:**<br>
Ici nous utilisons l'OS *DietPi* au lieu de l'OS d'origine Raspbian, le *UUID* de la partition Linux se trouve dans le fichier /boot/armbianEnv.txt, qui n'est **pas le même** que celui de *Raspbian* (/boot/cmdline.txt). Ce script de clonage **ne fonctionnera PAS pour un Raspbian**, mais il serait très facile de le modifier pour qu'il fonctionne pour un Raspbian !

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

