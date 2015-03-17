#!/bin/sh
# init ruby on rails  

set -e

# Install mysql
rpm -qa |grep -i mysql-server || yum install -y mysql*
/etc/init.d/mysqld start

#git clone leoapp to /home/ruby
[ ! -d "/home/ruby/" ] && mkdir /home/ruby;

[ ! -d "leoapp" ] && git clone git@github.com:yeziyitao/leoapp.git /home/ruby/leoapp;

#init mysql ;
mysql -e "drop database IF EXISTS myapp_development";
mysql -e "create database myapp_development;";

# start rails server port 80,listen 0.0.0.0
cd /home/ruby/leoapp/mysite/myapp/bin;
rake db:migrate RAILS_ENV=development
rails s -p 80 -b 0.0.0.0 &



