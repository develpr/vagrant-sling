#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install software-properties-common python-software-properties -y --force-yes


sudo apt-get update

sudo apt-get install -y unzip vim git-core curl wget build-essential python-software-properties
sudp apt-get install git -y

sudo apt-get install apache2 -y --force-yes


sudo apt-get install nfs-common portmap -y --force-yes


#install redis
cd ~
sudo wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
sudo cp src/redis-server /usr/local/bin/
sudo cp src/redis-cli /usr/local/bin/
sudo mkdir /etc/redis
sudo mkdir /var/redis
sudo cp utils/redis_init_script /etc/init.d/redis_6379
sudo cp redis.conf /etc/redis/6379.conf
sudo mkdir /var/redis/6379
sudo sed -i "s/daemonize no/daemonize yes/g" "/etc/redis/6379.conf"
sudo sed -i "s/dir .\//dir \/var\/redis\/6379/g" "/etc/redis/6379.conf"
sudo update-rc.d redis_6379 defaults
/etc/init.d/redis_6379 start

cd ~
sudo apt-get install zsh -y
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#chsh -s $(which zsh)
sudo chsh -s $(which zsh)

#install SVN
sudo apt-get install subversion -y


sudo apt-get install default-jre -y

sudo apt-get install default-jdk -y

#this installs 3.0.x, we need a later version
#sudo apt-get install maven -y
sudo cd ~
sudo wget http://ppa.launchpad.net/natecarlson/maven3/ubuntu/pool/main/m/maven3/maven3_3.2.1-0~ppa1_all.deb
#sudo apt-get install gdebi
sudo dpkg -i maven3_3.2.1-0~ppa1_all.deb
sudo ln -s /usr/share/maven3/bin/mvn /usr/bin/maven
sudo rm -rf /usr/bin/mvn
ln -s /usr/bin/maven /usr/bin/mvn
sudo ln -s /usr/bin/maven /usr/bin/mvn

#install sling
# @see http://sling.apache.org/documentation/development/getting-and-building-sling.html
#svn co http://svn.apache.org/repos/asf/sling/trunk sling
#cd sling
#sudo export MAVEN_OPTS="-Xmx512M -XX:MaxPermSize=512m"
#sudo mvn clean install -DskipTests
#cd launchpad/builder
#java -Xmx384M -agentlib:jdwp=transport=dt_socket,address=30303,server=y,suspend=n -jar target/org.apache.sling.launchpad-8-SNAPSHOT.jar


cd ~
wget http://mirror.reverse.net/pub/apache//sling/org.apache.sling.launchpad-7-standalone.jar

#
#              INSTALL NODE/NODEJS (apparently not required)
#
#cd ~
#sudo wget -qO- https://deb.nodesource.com/setup_4.x | sudo bash -
#sudo apt-get install nodejs -y
