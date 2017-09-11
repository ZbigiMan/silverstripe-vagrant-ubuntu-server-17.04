export COMPOSER_ALLOW_SUPERUSER=1
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update

# installing mysql-server
sudo -E apt-get -q -y install mysql-server

# crating database and user
mysql --user=root -e "CREATE DATABASE SS_mysite;"
mysql --user=root -e "CREATE USER 'ssuser'@'localhost' IDENTIFIED BY 'ssuser@pass';"
mysql --user=root -e "GRANT ALL PRIVILEGES ON SS_mysite.* TO 'ssuser'@'localhost';"
mysql --user=root -e "FLUSH PRIVILEGES;"

# restarting mysql server
sudo /etc/init.d/mysql restart

sudo apt-get install -y curl zip unzip git

#installing apache2 and php7
sudo apt-get install -y apache2 libapache2-mod-php7.0
sudo apt-get install -y php php-common php-mysql php-mcrypt* php-gd php-tidy php-xml php-mbstring php-curl

#apache2 config
echo "Include /vagrant/_config/apache2.conf" >> /etc/apache2/sites-available/000-default.conf
# echo "date.timezone = Europe/Warsaw" >> /etc/php/7.0/apache2/php.ini

if [ ! -h /var/www ]; 
then 
    mkdir /vagrant/public
    mkdir /vagrant/log
    rm -rf /var/www/html
    ln -fs /vagrant/public/silverstripe /var/www/html
    a2enmod rewrite
    a2query -m php7.0
    sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/000-default.conf   
        
    #restarting apache2   
    sudo service apache2 restart  

    #installing composer
    sudo curl -s https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer

    #creating Silverstripe project
    cd /vagrant/public
    sudo composer create-project silverstripe/installer ./silverstripe

    #Silverstripe envinorment config
    cp /vagrant/_config/_ss_environment.php /vagrant/public  
fi