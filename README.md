# Redis Dockerfile

A Dockerfile that produces a Docker Image for [Redis](http://redis.io/) based on official redis container.

## Redis version

The `master` branch currently hosts Redis 2.8.

## Usage

### Build the image

To create the image `sinet/redis:2.8`, execute the following command on the `docker-redis/2.8` folder:

```
$ docker build -t sinet/redis:2.8 .
```

### Run the image

To run the image and bind to host port 6379:

```
$ docker run -d --name sinet-redis -p 6379:6379 sinet/redis:2.8
```

#### Credentials

If you want to preset credentials you can set the following environment variables:

* `REDIS_PASS` to set a specific password

```
$ docker run -d \
    --name sinet-redis \
    -p 6379:6379 \
    -e REDIS_PASS=mypassword \
    sinet/redis:2.8
```

#### Extra arguments

When you run the container, it will start the Redis server without any arguments. If you want to pass any arguments,
just add them to the `run` command:

```
$ docker run -d --name sinet-redis -p 6379:6379 sinet/redis:2.8 --loglevel debug
```