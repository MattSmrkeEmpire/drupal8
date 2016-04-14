#!/bin/bash

# Move the settings.php
#chmod 755 sites/default
#chmod 755 sites/default/settings.php
#mv sites/default/settings.php sites/default/settings.tmp.php
site_name='Development'
db_name='drupal8db'

# Install Drupal virgin version
echo Site name will be ${site_name}
drush site-install standard -y --account-name=dev --account-pass=dev --db-url=mysql://root:root@localhost/${db_name} --site-name=${site_name}
