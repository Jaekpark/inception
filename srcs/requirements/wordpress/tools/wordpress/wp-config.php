<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
#define( 'DB_NAME', 'wordpress' );
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );

/** MySQL database username */
define( 'DB_USER', 'jaekpark' );
#define( 'DB_USER', getenv('WORDPRESS_DB_PASSWORD') );

/** MySQL database password */
define( 'DB_PASSWORD', 'jaekpark' );
#define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );
#define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

#define( 'WP_HOME', getenv('WP_HOME') );
#define( 'WP_SITEURL', getenv('WP_SITEURL') );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '6w.v56Z= -AKj6)dB-tzh)8%Qw=Wd|A^^.PhU%eLZxr+JA`qRth^ZIOIZsfI<rS=');
define('SECURE_AUTH_KEY',  'gT=`(uI|o$5oD# I~n|k~_1jZl2nk@=ynf18:BQ$36{gXHGaR1EkSleFR 2@k?+8');
define('LOGGED_IN_KEY',    'raM-)8E/=H_YW0~R/.9]9)RUg.+$Hm+@VO+:~H8x1vtCH1ABR$N}!?|rD$I*CU] ');
define('NONCE_KEY',        'g|7r`<=,q#*r!^K|?8X!+UUI8+6,1LHQq#cxu~4E>xN!k+8Z}^zReP*Y/CO,ZuG7');
define('AUTH_SALT',        '>eSy;Hi-+=~q%c#J~t,|/kqwlBc}r+|Gh7/a#TBONx.jaLYLjP+-D:McF+~ZICZS');
define('SECURE_AUTH_SALT', '}HdKxP-_&r:@}n/_AZt1kgR$OkfItVhk0wRG%0:)uYos,w+>|M8GLb]sIjkhkhbW');
define('LOGGED_IN_SALT',   'IN-K_/ap=5sXvpDOtZ AJ dMuBalokYZYdq|3qx%y;a`o}o;-+_CyYCDpsE-!-yP');
define('NONCE_SALT',       'G)A|L#,k*u#E:`.$*P|DW Y9zSr`*#NIv0!=COE=Qp[CPyzv5nLEIR5dP|W.q+K0');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );
/** Add any custom values after this line. */

//define( 'WP_USE_EXT_MYSQL', false );

/** Custom values must be above this line. That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
