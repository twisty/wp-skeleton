# wp-skeleton

A set of config files and instructions to bootstrap an environment suitable for developing Wordpress sites.

Included goodies included include:

* [twisty/wp-vagrant-apache](https://github.com/twisty/wp-vagrant-apache): a Vagrant box ready to serve Wordpress using apache.
* [wp-cli](http://wp-cli.org/): wrangle Wordpress from the command line.

## Requirements

You’ll need [Composer](http://getcomposer.org/).

## Install

    git clone https://github.com/twisty/wp-skeleton.git  
    git submodule update --init  
    composer update

## Getting started

### Vagrant

This may require a bit of setup, read the [separate install file](https://github.com/twisty/wp-vagrant-apache/blob/master/INSTALL.md) for details.

Run an Ubuntu LAMP stack:

    cd wp-vagrant-apache  
    vagrant up

Go to [http://localhost:8888/](http://localhost:8888/) to see the files served from `./htdocs`.

### wp-cli

Start Vagrant, then run `./setup-wordpress.sh`. This will:

* Download the latest Wordpress.
* Add a default “author” user.
* Scaffold some dummy posts.
* Install some useful development plugins.

Wordpress will be installed to `./htdocs/wordpress/` and viewable at [http://localhost:8888/wordpress/](http://localhost:8888/wordpress/).

wp-cli is available via Composer at `./vendor/bin/wp`.
