#!/bin/bash

internal_server_ip=192.168.111.64
key_name=pragyakeypair.pem
script_name=instance_script.sh

resources_path=/home/ubuntu/globule/resources

#TODO: get these two from openstack somehow
external_instance_ip=130.207.111.185
internal_instance_ip=192.168.111.86

default_instance_location=/home/ubuntu
new_key_location=$default_instance_location/$key_name
new_script_location=$default_instance_location/$script_name

instance_name=$(sudo cat /etc/hostname)
instance_number=${instance_name:15}
setup_location=~/Setup$instance_number
apache_location=$setup_location/httpd-2.2.0
globule_location=$setup_location/mod-globule-1.3.2

openssl_install_location=/usr/local/openssl
globule_install_location=/usr/local/globule-Setup$instance_number

#modify /etc/hosts to understand sudo.
#HACK: making /etc/hosts writable for now.
sudo chmod ugo+w /etc/hosts
echo "127.0.1.1 $instance_name" >> /etc/hosts

sudo mkdir $setup_location
cd $setup_location
sudo mkdir httpd-2.2.0
sudo mkdir mod-globule-1.3.2
sudo cp -r ~/httpd-2.2.0/* $setup_location/httpd-2.2.0/
sudo cp -r ~/mod-globule-1.3.2/* $setup_location/mod-globule-1.3.2/

sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y libtool
sudo apt-get install -y zlib1g-dev libncurses5-dev

#-------------------------------------------------------------------------------------------------
#Installing openssl 0.9.8y. NOTE: this openssl installation overrides the default openssl installation in the system. Original version present was openssl-1.0.1f. We want 0.9.8y. To check version, type openssl version

cd $setup_location
wget http://www.openssl.org/source/openssl-0.9.8y.tar.gz
tar -zxvf openssl-0.9.8y.tar.gz
cd openssl-0.9.8y
sudo ./config --prefix=/usr/local --openssldir=$openssl_install_location zlib-dynamic shared
sudo make
sudo make install_sw

#--------------------------------------------------------------------------------------------------
#Installing apache (httpd-2.2.0)

cd $apache_location
touch modules/ssl/ssl_expr_parse.c
touch modules/ssl/ssl_expr_parse.h
touch modules/ssl/ssl_expr_scan.c
sudo ./configure --prefix=$globule_install_location --with-included-apr --enable-so --with-ssl=/usr/local/openssl/ -enable-auth-anon=shared --enable-auth-dbm=shared --enable-cache=shared --enable-file-cache=shared --enable-disk-cache=shared --enable-mem-cache=shared --enable-example=shared --enable-deflate=shared --enable-ssl --enable-proxy=shared --enable-proxy-ftp=shared --enable-proxy-http=shared --enable-proxy-connect=shared --enable-expires=shared --enable-headers --enable-mime-magic --enable-http --disable-dav --enable-status=shared --enable-asis=shared --enable-suexec=shared --enable-info=shared --enable-cgi=shared --enable-include=shared --enable-vhost-alias=shared --enable-rewrite=shared -disable-static
sudo make
sudo make install

#--------------------------------------------------------------------------------------------------
#Installing globule (mod-globule-1.3.2)

sudo cp -r /usr/local/lib/libssl.* $globule_install_location/lib/
sudo cp -r /usr/local/lib/libcrypto.* $globule_install_location/lib/
sudo cp /usr/local/bin/openssl $globule_install_location/bin/

cd $globule_location
touch sample/globuleadm/*.html
touch sample/globuleadm/*.cgi
touch sample/globuleadm/*.php
touch sample/globuleadm/*.png
touch sample/globuleadm/*.xcf
sudo ./configure --with-apache=$globule_install_location
sudo make
sudo make install




