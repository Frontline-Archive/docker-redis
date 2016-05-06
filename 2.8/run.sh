#!/bin/bash

# Initializing redis
if [ ! -f /data/redis_configured ]; then
	if [ "${REDIS_PASS}" != "" ];then
		echo "Securing Redis with a password..."
		
		echo -e "\nrequirepass ${REDIS_PASS}" >> /usr/local/etc/redis/redis.conf

		echo "========================================================================"
		echo "Redis Password: \"${REDIS_PASS}\""
		echo ""
		echo "Please remember to change the above password as soon as possible!"
		echo "========================================================================"
	else
		echo "========================================================================"
		echo "Your redis instance is not secure."
		echo "Try running container with \"-e REDIS_PASS=yourpassword\""
		echo "========================================================================"
	fi

	touch /data/redis_configured
fi

# Start Redis
echo "Starting Redis..."
redis-server /usr/local/etc/redis/redis.conf $@