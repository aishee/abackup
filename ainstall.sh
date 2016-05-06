#!/usr/bin/env bash


clear

echo "
#####################################
#                                   #
#                                   #
#    Follow me on Github: @Aishee   #
#   __version__ == "1.0"            #
#   __author__ = "Aishee"           #
#   __email__ = "aishee@aishee.net" #
#   __website__ = "aishee.net"      # 
# please, if you don not know what  #
# you are doing, DO NOT edit any-   #
# thing up. Thanks.                 # 
#####################################
"
echo "Welcome you!"
echo "Please make sure that your server"
echo "is running a fresh and minimal OS Installation"
echo "This script may install additional software packages"

echo "Press [Enter] key to start the installation or CTRL+C to abort..."
read -s -n 1 EnterKey

while [ "$EnterKey" != "" ]
do
    echo "Press [Enter] key to start the installation or CTRL+C to abort..."
    read -s -n 1 EnterKey
done

arch=$(uname -a)

function cmd_exists() {
    hash ${1} 2>/dev/null
    return $?
}

if cmd_exists 'apt-get'; then
    echo "Updating your system..."
    apt-get -qy update && apt-get -qy upgrade
    apt-get -qy install apache2 git php5 php5-cli php5-mcrypt php5-mysql sendmail sendmail-bin libapache2-mod-php5 wget curl
    cd /var
    git clone https://github.com/aishee/abackup.git
    rm -rf www
    mv abackup www
    cd www
    mv htaccess.txt .htaccess
    sed -i "s|/var/www/html|/var/www|g" config.php
    mkdir files
    mkdir templates_c
    mkdir configs
    mkdir cache
    chmod -R 777 files templates_c configs cache
    chmod -R 777 db/*.json
    service sendmail start
    service apache2 restart
elif cmd_exists 'yum'; then

    echo "Installing EPEL..."
    if [[ $arch == *x86_64* ]]
    then
        wget -q http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
        rpm -ivh epel-release-6-8.noarch.rpm
    else
        wget -q http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
        rpm -ivh epel-release-6-8.noarch.rpm
    fi
    
    echo "Updating your system..."
    yum -y -q update

    echo "Installing required packages..."
    yum -y -q install git httpd php php-cli php-mcrypt php-mysql php-pdo sendmail wget curl

    echo "Downloading main package..."
    cd /var/www/
    git clone https://github.com/aishee/abackup.git
    rm -rf html
    mv abackup html
    cd html
    mv htaccess.txt .htaccess
    mkdir files
    mkdir templates_c
    mkdir configs
    mkdir cache
    chmod -R 777 files templates_c configs cache
    chmod -R 777 db/*.json
    service sendmail start
    service httpd restart
    
else
    echo "OS/Package manager not supported; exiting."
    exit
fi

publicip=$(wget --prefer-family=ipv4 -qO - api.petabyet.com/ip)

clear

echo "ABackup has been successfully installed"
echo "The web interface can be accessed at"
echo "http://${publicip}"
echo "The default login detail is:"
echo "Username: aishee"
echo "Password: aishee"
echo "You should update the username and password, can't using default config"
echo ""
