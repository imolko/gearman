#!/bin/sh
set -e

if [ "${1#-}" != "$1" ]; then
	set -- gearmand "$@"
fi

if [ "$1" = 'gearmand' ]; then

	if [ ! -z $GEARMAN_SQLITE_FILE ]; then
		set -- "$@" \
		"--queue-type=libsqlite3" \
		"--libsqlite3-db=$GEARMAN_SQLITE_FILE"
	fi

	if [ ! -z $GEARMAN_MEMCACHE_HOST ]; then
  		set -- "$@" \
  		    "--queue-type=libmemcached" \
  		    "--libmemcached-servers=$GEARMAN_MEMCACHE_HOST"
	fi

	if [ ! -z $GEARMAN_MYSQL_HOST ]; then
		set -- "$@" "--queue-type=mysql" \
			"--mysql-host=$GEARMAN_MYSQL_HOST" \
			"--mysql-port=${GEARMAN_MYSQL_PORT:-3306}" \
			"--mysql-user=${GEARMAN_MYSQL_USER:-gearman}" \
			"--mysql-password=${GEARMAN_MYSQL_PASSWORD:-gearman}" \
			"--mysql-db=${GEARMAN_MYSQL_DB:-gearman}" \
			"--mysql-table=${GEARMAN_MYSQL_TABLE:-gearman_queue}"
	fi

	echo "Starting gearman job server with params: $@"

	exec "$@"
fi

exec "$@"
