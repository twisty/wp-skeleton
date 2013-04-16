#!/bin/sh

WP='./vendor/bin/wp'
WP_PLUGIN_PATH=$($WP plugin path --dir)

function random_date {

    echo $(printf '%04d-%02d-%02d %02d:%02d:%02d' $((RANDOM%3+2010)) $((RANDOM%12+1)) $((RANDOM%27+1)) $((RANDOM%23+1)) $((RANDOM%59+1)) $((RANDOM%59+1)))

}

function generate_posts {

    POST_AUTHOR=$1
    COUNTER=0

    while [ $COUNTER -lt 20 ]; do
        echo "Post content." | $WP post create - \
            --post_date="$(random_date)" \
            --post_author=$POST_AUTHOR \
            --post_title="Random post $COUNTER" \
            --post_status=publish
        let COUNTER+=1
    done
}

function ensure_plugin {
    if [ -e "$WP_PLUGIN_PATH/$1" ]; then
        echo "Plugin \"$1\" is installed."
    else
        $WP plugin install $1 --activate
    fi
}

$WP core is-installed
if [ $? -eq 0 ]; then

    echo 'WordPress is already installed.'

    echo 'Resetting database.'
    $WP db reset --yes

else

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
    $WP core install --url='http://localhost:8888/wordpress' --title='WP Skeleton' --admin_email=admin@example.com --admin_password=admin

fi

echo 'Deleting existing authors.'
$WP user delete $($WP user list --role=author --ids)

echo 'Creating an author user.'
USER_ID=`$WP user create anne anne.author@example.com --role=author --user_pass=author --display_name='Anne Author' --porcelain`
if [ $? -eq 0 ]; then

    echo 'Deleting all posts.'
    $WP post delete $($WP post list --ids) --force

    echo 'Adding sample posts.'
    generate_posts $USER_ID

    echo 'Creating a post with some more detail'
    echo 'Hello foo bar' | ./vendor/bin/wp post create - --post_author=$USER_ID --post_title='Hello Again World' --post_status=publish

fi

##
# Fix needed when not running on port 80.
#
# We need to set these options again as WordPress seems to strip the port during
# install?
#
$WP option set siteurl http://localhost:8888/wordpress
$WP option set home http://localhost:8888/wordpress

ensure_plugin developer
ensure_plugin theme-check
ensure_plugin theme-test-drive
ensure_plugin debug-bar
