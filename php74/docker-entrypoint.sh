#!/bin/bash

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- supervisord "$@"
fi

service cron start

exec "$@"