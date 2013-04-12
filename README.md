# wp-skeleton

A set of config files and instructions to bootstrap an environment suitable for developing Wordpress sites.

## Requirements

You’ll need [Composer](http://getcomposer.org/).

## Install

    git clone https://github.com/twisty/wp-skeleton.git  
    git submodule update --init  
    composer update

## Getting started

### Vagrant

[twisty/wp-vagrant-apache](https://github.com/twisty/wp-vagrant-apache) is included, this provides a Vagrant box set up with apache, php and mysql.

This requires a bit of setup, read [the install file](https://github.com/twisty/wp-vagrant-apache/blob/master/INSTALL.md) for details.

Run run an Ubuntu LAMP stack:

    cd wp-vagrant-apache  
    vagrant up

Go to [http://localhost:8888/](http://localhost:8888/) to see the files served from `./htdocs`.

### wp-cli

[wp-cli](http://wp-cli.org/) is available at `./vendor/bin/wp` ready to start wrangling Wordpress.  

It is set up to use `./htdocs/wp/` as the Wordpress location.

For example: run `./vendor/bin/wp core download` to download the latest Wordpress and (if using Vagrant) go to [http://localhost:8888/wp/](http://localhost:8888/wp/) to view.
