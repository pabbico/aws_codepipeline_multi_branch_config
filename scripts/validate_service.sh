#!/bin/bash

echo "Validating and deploying build..."

# Identify ENV from deployment group
case "$DEPLOYMENT_GROUP_NAME" in
  *dev*)
    ENV="dev"
    ;;
  *stage*)
    ENV="staging"
    ;;
  *prod*)
    ENV="prod"
    ;;
  *)
    echo " Unknown deployment group: $DEPLOYMENT_GROUP_NAME"
    exit 1
    ;;
esac

SOURCE_PATH="/home/ubuntu/artifacts/${ENV}/build/"
DEST_PATH="/var/www/${ENV}/public_html/"

echo "Copying files from $SOURCE_PATH to $DEST_PATH"
rm -rf "$DEST_PATH"/*
cp -r "$SOURCE_PATH"* "$DEST_PATH"

echo "React app deployed to $ENV"
