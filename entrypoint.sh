#!/bin/bash
set -e

export USER=bear
UID=${UID:-1000}
GID=${GID:-1000}
groupmod -o -g "$GID" $USER
usermod -o -u "$UID" $USER

# Update ownership of key directories
chown -R $USER:$USER /app

# Switch to bearlytics and run the provided command
exec su $USER -c "$@"