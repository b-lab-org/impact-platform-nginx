# Impact Platform: Nginx
[Docker](https://www.docker.com/) container for [Nginx](https://www.nginx.com/resources/wiki/).

## Overview
Use with the [data container](https://github.com/b-lab-org/impact-platform-data) and [phpfpm container](https://github.com/b-lab-org/impact-platform-phpfpm).

* Certfificates and keys go in `/data/config/ssl/`.
* Sites go in `/data/config/sites/`.
* Nginx logs can be found in `/data/logs/`.

## Docker-Compose Usage
```
nginx:
    image: impactbot/impact-platform-nginx
    volumes_from:
        - data
    ports:
        - "80:80"
        - "443:443"
    links:
        - php

# required
php:
    image: impactbot/impact-platform-php
    volumes_from:
        - data
    ports:
        - "9000:9000"
```

* The [phpfpm container](https://github.com/b-lab-org/impact-platform-phpfpm) is required and aliased as `php` with docker-compose.
