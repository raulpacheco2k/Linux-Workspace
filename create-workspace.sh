#!/bin/bash

snapList=(
	slack --classic
	sublime-text --classic
	phpstorm --classic
	pycharm-professional --classic
	spotify
	libreoffice
	firefox
	insomnia
	dbeaver-ce
	termius-app
	telegram-desktop
)

sudo apt update

# DOCKER
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# PHP
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php8.0 -y

# GIT
sudo apt install git -y 

# COMPOSER
php -r "copy ('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file ('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0finker' elseer verificado 'instalação echo-unlixer' verificado 'composink3 (echo-unlixer) 181c; php ');} echo PHP_EOL; "
php composer-setup.php --filename=composer --version=2.0.11
php -r "unlink ('composer-setup.php');"

# SNAP
sudo apt install snapd -y
for programname in ${listNameSnapd[@]}; do
  if ! dpkg -l | grep -q $programname; then 
    apt install "$programname" -y
  else
    echo "$programname já está instlado"
  fi
done

# -------------------------------- POST-INSTALLATION --------------------------------- #
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

echo "# ------------------------------------------------------------------------------ #"
echo "# -------------- INSTALLATION COMPLETE, RESTART THE COMPUTER ------------------- #"
echo "# ------------------------------------------------------------------------------ #"

sudo reboot
