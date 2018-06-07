#!/bin/sh

service apache2 stop
sed -i 's|OPENML_HOST|'$OPENML_HOST'|g' openml_OS/config/BASE_CONFIG.php
sed -i 's|OPENML_PROTOCOL|'$OPENML_PROTOCOL'|g' openml_OS/config/BASE_CONFIG.php
sed -i 's|EMAIL_FROM_ADDRESS|'$EMAIL_FROM_ADDRESS'|g' openml_OS/config/BASE_CONFIG.php
sed -i 's|EMAIL_API_LOG_ADDRESS|'$EMAIL_API_LOG_ADDRESS'|g' openml_OS/config/BASE_CONFIG.php

ln -sf /dev/stdout /var/log/apache2/access.log
ln -sf /dev/stderr /var/log/apache2/error.log
apache2-foreground
