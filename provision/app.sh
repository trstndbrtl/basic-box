# Updating Ubuntu
echo "# Update Ubuntu"
sudo apt-get update >> /vagrant/log/process.log 2>&1
# Installing vim
echo "# Install vim"
sudo apt-get install vim -y >> /vagrant/log/process.log 2>&1
# Installing Apache2
echo "# Install Apache2"
sudo apt-get install apache2 -y >> /vagrant/log/process.log 2>&1
sudo a2enmod rewrite
sudo systemctl restart apache2 >> /vagrant/log/process.log 2>&1
# Setting MySQL root user password root/root
echo "# Install Mysqp"
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
# Installing packages Mysql
apt-get install -y mysql-server mysql-client >> /vagrant/log/process.log 2>&1
# Allow External Connections on your MySQL Service
sudo sed -i -e 's/bind-addres/#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i -e 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo service mysql restart >> /vagrant/log/process.log 2>&1
# create client database
if [ ! -d "/usr/share/adminer" ]; then
  mysql -u root -proot -e "CREATE DATABASE $1;" >> /vagrant/log/process.log 2>&1
fi
echo "# Install Curl Unzip Git"
sudo apt-get install curl unzip git -y >> /vagrant/log/process.log 2>&1
echo "# Install Php"
sudo apt-get install php -y >> /vagrant/log/process.log 2>&1
sudo apt-get install libapache2-mod-php -y >> /vagrant/log/process.log 2>&1
sudo apt-get install php-curl php-cli php-gd php-fpm php-dompdf php-intl php-json -y >> /vagrant/log/process.log 2>&1
sudo apt-get install php-mbstring php-xml php-zip php-imagick php-imap php-mysql php-gettext -y >> /vagrant/log/process.log 2>&1
echo "# Store some Php Configuration"
sudo sed -i -e 's/post_max_size = [1-9]*M/post_max_size = 512M/' /etc/php/7.2/apache2/php.ini >> /vagrant/log/process.log 2>&1
sudo sed -i -e 's/upload_max_filesize = [1-9]*M/upload_max_filesize = 512M/' /etc/php/7.2/apache2/php.ini >> /vagrant/log/process.log 2>&1
sudo sed -i -e 's/memory_limit = [1-9]*M/memory_limit = 512M/' /etc/php/7.2/apache2/php.ini >> /vagrant/log/process.log 2>&1
sudo systemctl restart apache2 >> /vagrant/log/process.log 2>&1
if [ ! -d "/usr/share/adminer" ]; then
  sudo mkdir /usr/share/adminer >> /vagrant/log/process.log 2>&1
  sudo wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php >> /vagrant/log/process.log 2>&1
  sudo ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php >> /vagrant/log/process.log 2>&1
fi
echo "Alias /adminer.php /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf >> /vagrant/log/process.log 2>&1
sudo a2enconf adminer.conf >> /vagrant/log/process.log 2>&1