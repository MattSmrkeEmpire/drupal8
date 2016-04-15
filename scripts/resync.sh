#!/bin/bash

site_name='Development'
db_name='drupal8_sandbox'

# Install Drupal virgin version
echo Site name will be ${site_name}
drush site-install standard -y --account-name=dev --account-pass=dev --db-url=mysql://root:root@localhost/${db_name} --site-name=${site_name}
