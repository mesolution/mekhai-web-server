#!/bin/bash
certbot --apache
certbot certonly -n -d mekhai.com -d www.mekhai.com
certbot renew --dry-run 
source /etc/apache2/envvars
#tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND
