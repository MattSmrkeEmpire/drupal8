# drupal8

This is an experimental / sandbox repo for multiple devs to collaborate on a Drupal 8 install.

## Setup
After cloning the repo, create the host in MAMP like normal. 
Add a new host with the domain name of `drupal8.local` and point the 'Document Root' to the `docroot` folder of this repo.

Copy the file `docroot/sites/default/ex-settings.php` to `docroot/sites/default/settings.php`.


## Install Scripts
This repo contains 2 different resync scripts in the `scripts` folder. Each of these is still run from inside the `docroot` folder like normal.

####1. resync.sh  
```
../scripts/resync.sh
```
This is the usual resync script that does a Drupal8 install using drush site-install. 

####2. clone-resync.sh  
```
../scripts/clone-resync.sh
```
This imports an initial_install sql dump directly instead of using drush site-install. Site name is still 'Development' and the admin user is still 'dev':'dev' like normal.

## Testing the Config Import / Export System
- Install the site using `../scripts/resync.sh`. Once it completes you can visit `http://drupal8.local` and should see a vanilla Drupal 8 install with the Bartik theme.  
- Switch branches to the `config-import` branch (`git checkout config-import`). There should be many new files in the `config/staging` folder.
- Still from inside `docroot`, run `drush config-import staging` (or `drush cim staging`). You will get an error that the UUIDs don't match.  

***  

- Re-install the site using `../scripts/clone-resync.sh`. Once it completes you can visit `http://drupal8.local` and should see a vanilla Drupal 8 install with the Bartik theme.  
- Switch to the `config-import` branch if you are not already on it.
- From inside `docroot`, run `drush cim staging`. It should ask you to confirm the new configs (press 'y') and afterwards reload the site. You should see the site change to the new name 'D8 Sandbox' and now be using the bootstrap theme.

####Gotchas
1. Occasionally, after running either install script I get a whitescreen with an error message. In all cases so far, just reloading the page has fixed the site.
2. If you run the `resync.sh` script and install the site using drush - any files in the `config/staging` directory get blown away. So don't run that script on the `config-import` branch.
