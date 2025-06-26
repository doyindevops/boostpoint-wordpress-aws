#!/bin/bash
yum update -y
yum install -y httpd php php-mysqlnd wget unzip

systemctl enable httpd
systemctl start httpd

cd /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip
mv wordpress/* .
rm -rf wordpress latest.zip

cat > /var/www/html/wp-config.php <<EOF
<?php
define( 'DB_NAME', "${db_name}" );
define( 'DB_USER', "${db_user}" );
define( 'DB_PASSWORD', "${db_pass}" );
define( 'DB_HOST', "${db_host}" );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
  define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
EOF

chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

# Author: Doyin Ekong (@doyindevops)
# Repo: https://github.com/doyindevops/logistics-tracking-platform

