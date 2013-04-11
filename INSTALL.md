# Requirements

## Vagrant

Get [Vagrant](http://www.vagrantup.com/) and install it.

## Puppet modules

We need the following puppet modules: [Apache](https://forge.puppetlabs.com/puppetlabs/apache) and [Mysql](https://forge.puppetlabs.com/puppetlabs/mysql), both installed into `~/.puppet/modules`.

I've installed these by installing [Puppet](https://puppetlabs.com/) and using the built-in module installer.

    puppet module install puppetlabs/apache  
    puppet module install puppetlabs/mysql

## Composer

Get [Composer](http://getcomposer.org/) and install it.

# Install

1. Make sure you meet the requirements set out above.
2. Run `composer update`.

That’s it.
