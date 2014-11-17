#!/bin/bash

internal_server_ip=192.168.111.64
key_name=pragyakeypair.pem
script_name=instance_script.sh

resources_path=//home/ubuntu/globule/resources

#TODO: get these two from openstack somehow
external_instance_ip=130.207.111.171
internal_instance_ip=192.168.111.6

default_instance_location=/home/ubuntu
new_key_location=$default_instance_location/$key_name
new_script_location=$default_instance_location/$script_name

instance_name=$(sudo cat /etc/hostname)
setup_location=~/Setup${instance_name:15}
instance_httpd_location=$setup_location/httpd-2.2.0
instance_mod_globule_location=$setup_location/mod-globule-1.3.2

#echo $setup_location
sudo mkdir $setup_location
sudo scp -r -i $new_key_location ubuntu@$internal_server_ip:$resources_path/* $setup_location/
