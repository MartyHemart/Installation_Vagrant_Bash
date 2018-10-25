#!/bin/bash

echo " dite nous tous: 1 ou 2 "
#options=("ubuntu1" "ubuntu2" "Quit")
ubuntu=""
read opt
    case $opt in
        "1") ubuntu="ubuntu\/xenial64"
        ;;
        "2") ubuntu="ubuntu2"
        ;;
        "Quit")
        ;;
    esac
if [[ "$ubuntu"=="ubuntu1" ]]; then
  echo " Vous avez $ubuntu "

elif [[ "$ubuntu"=="ubuntu2" ]]; then
  echo "Bravo vous avez la $ubuntu"
fi

echo "vous avez selectionner la version $ubuntu"

echo "taper OK ou NO pour continuer: "
read ok
     if [ "$ok" = "ok" ] || [ "$ok" = "OK" ]; then
        echo  "$ok l'installation de Vagrant va démarrer !!"
        vagrant init
        sed -i -e 's/base/'$ubuntu'/' Vagrantfile
        sed -i -e 's/# config.vm.network "private_network", ip: "192.168.33.10"/config.vm.network "private_network", ip: "192.168.33.10"'/ Vagrantfile
        sed -i -e 's/# config.vm.synced_folder "..\/data", "\/vagrant_data"/config.vm.synced_folder ".\/data", "\/var\/www\/html"'/ Vagrantfile
        mkdir data
        vagrant up
        vagrant ssh
   elif [ "$ok" = "no" ] || [ "$ok" = "NO" ]; then
        echo "merci à vous ! A bientôt"
   else
   echo "Vous n'avez rien choisie, bye."
   fi
