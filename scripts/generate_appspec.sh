#!/bin/bash
set -e

: "${BUILD_ENV:? BUILD_ENV is not set! Exiting.}"

echo "🛠 Generating appspec.yml from template..."
sed "s|\${BUILD_ENV}|$BUILD_ENV|g" appspec.template.yml > appspec.yml
echo " appspec.yml generated for env: $BUILD_ENV"
