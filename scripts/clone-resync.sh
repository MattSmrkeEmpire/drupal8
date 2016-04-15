#!/bin/bash

site_name='Development'
db_name='drupal8_sandbox'

# Setup fresh database
mysql -uroot -proot -e "DROP DATABASE IF EXISTS ${db_name}; CREATE DATABASE ${db_name};"


# Install Drupal virgin version
mysql -uroot -proot ${db_name} < ../scripts/schema/initial_install.sql
echo 'Drupal8 installed from db clone'
