<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wordpressuser' );
define( 'DB_PASSWORD', 'root' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define( 'AUTH_KEY',         'this is my sentence' );
define( 'SECURE_AUTH_KEY',  'this is my sentence' );
define( 'LOGGED_IN_KEY',    'this is my sentence' );
define( 'NONCE_KEY',        'this is my sentence' );
define( 'AUTH_SALT',        'this is my sentence' );
define( 'SECURE_AUTH_SALT', 'this is my sentence' );
define( 'LOGGED_IN_SALT',   'this is my sentence' );
define( 'NONCE_SALT',       'this is my sentence' );
$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}
require_once( ABSPATH . 'wp-settings.php' );
