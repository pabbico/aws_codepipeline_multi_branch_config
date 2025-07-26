#!/bin/bash
echo "Preparing deployment directories..."

# You can set permissions or move build files if needed here
mkdir -p /var/www/dev/public_html/
mkdir -p /var/www/staging/public_html/
mkdir -p /var/www/prod/public_html/
