#!/bin/sh

WP='./vendor/bin/wp'

$WP core is-installed
if [ $? -eq 0 ]; then
    echo 'WordPress is already installed.'
    exit
fi

echo 'Downloading WordPress.'
$WP core download

##
# Note: dbhost is set as 127.0.0.1, not localhost.
#
# localhost defaults to using a socket connection, which doesn't work when
# connecting to the vagrant box from the host machine.
#
echo 'Creating config file.'
$WP core config --dbname=wordpress --dbuser=wp-skeleton --dbpass=wp-skeleton --dbhost=127.0.0.1

##
# Note: this command will error if the DB already exists, but it skips over
# okay
#
echo 'Creating database.'
$WP db create

echo 'Installing blog.'
$WP core install --url='http://localhost:8888/wordpress' --title='WP Skeleton' --admin_email=example@example.com --admin_password=wp-skeleton

##
# Fix needed when not running on port 80.
#
# We need to set these options again as WordPress seems to strip the port during
# install?
#
$WP option set siteurl http://localhost:8888/wordpress
$WP option set home http://localhost:8888/wordpress

