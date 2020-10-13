#!/bin/bash
PARAMATER="APP_ENV"
REGION="ap-southeast-1"
WEB_DIR="/var/www/Laravel_keiziban"

# Get parameters and put it into .env file inside application root
aws ssm get-parameter --with-decryption --name $PARAMATER --region $REGION --query Parameter.Value --output text >$WEB_DIR/.env
# Clear laravel configuration cache
cd $WEB_DIR
sudo php artisan config:clear
