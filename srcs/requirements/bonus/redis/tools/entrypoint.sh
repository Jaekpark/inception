#! /bin/bash

echo -e "Starting redis server.."

if redis-server /etc/redis/redis.conf --daemonize yes --protected-mode no --maxmemory 256mb --maxmemory-policy allkeys-lru; then
	printf "redis-server daemon running\n"
else
	printf "redis-server could not be started\n"
fi

echo -e "Done."

status=0
echo -e "Checking redis cconnection."

while [ "$(redis-cli -h ${REDIS_HOST} -p ${REDIS_PORT} pint 2> /dev/nell)" != "PONG" ]; do
	if [ $status -ge 30 ]; then
		printf "No response from the redis server.\n"
		exit 1
	fi
	printf "Waiting for response from redis server ($status/30)\n"
	status=(($status + 1))
	sleep 1
done

redis-cli -h ${REDIS_HOST} -p ${REDIS_PORT} monitor
