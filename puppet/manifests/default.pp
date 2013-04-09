file { '/var/www':
  ensure => link,
  target => "/vagrant/htdocs",
  force  => true
}

include mysql
include apache

class { 'mysql::server':
  config_hash => { 'root_password' => 'wp-skeleton' }
}

class {'apache::mod::php': }

apache::mod { 'rewrite': }
apache::mod { 'expires': }

class php {
  package { "php5": ensure => present }
  package { "php5-sqlite": ensure => present }
  package { "php5-mysql": ensure => present }
  package { "php5-cli": ensure => present }
  package { "php5-curl": ensure => present }
}

include php
