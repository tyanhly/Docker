#!/bin/sh

cat > /etc/apache2/sites-available/000-default.conf << EOF
<VirtualHost *:80>
 ServerName $SERVER_NAME
 DocumentRoot $DOCUMENT_ROOT
 <Directory $DOCUMENT_ROOT>
  Options +FollowSymlinks
  AllowOverride $ALLOW_OVERRIDE
 </Directory>
</VirtualHost>
EOF
/apache_foreground.sh
