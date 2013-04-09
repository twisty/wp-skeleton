# wp-skeleton

A set of config files and instructions to bootstrap a Vagrant LAMP stack including wp-cli suitable for developing Wordpress sites.

If it all works okay you should end up with a Vagrant box set up with apache, php and mysql.

[wp-cli](http://wp-cli.org/) is also installed ready to start wrangling Wordpress.  

## Requirements

### Vagrant

Get [Vagrant](http://www.vagrantup.com/) and install it.

### Puppet modules

We need the following puppet modules: [Apache](https://forge.puppetlabs.com/puppetlabs/apache) and [Mysql](https://forge.puppetlabs.com/puppetlabs/mysql), both installed into `~/.puppet/modules`.

I've installed these by installing [Puppet](https://puppetlabs.com/) and using the built-in module installer.

    puppet module install puppetlabs/apache  
    puppet module install puppetlabs/mysql

### Composer

Get [Composer](http://getcomposer.org/) and install it.

## Install

1. Make sure you meet the requirements set out above.
2. Run `composer update`.

## Getting started

### Vagrant

Run `vagrant-up` to run an Ubuntu LAMP stack. Go to http://localhost:8888/ to see the files served from `./htdocs`.

### wp-cli

wp-cli should be available at `./vendor/bin/wp`. It is set up to use `./htdocs/wp/` as the Wordpress location.

For example: run `./vendor/bin/wp core download` to download the latest Wordpress and (if using Vagrant) go to http://localhost:8888/wp/ to view.
