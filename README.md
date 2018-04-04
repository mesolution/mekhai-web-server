# mekhai-web-server

nginx:
  image: 'registry-intl.ap-southeast-1.aliyuncs.com/measiagroup/nginx-centos:latest'
  ports:
    - '8811:80/tcp'
    - '4811:443/tcp'
  restart: always
  labels:
    aliyun.scale: '1'
    aliyun.routing.port_80: mekhai-test-site;mekhai.com;www.mekhai.com
  links:
    - php
  volumes:
    - 'mekhai-site.config:/etc/nginx/:rw'
    - 'mekhai-website:/usr/share/nginx/html/:rw'
php:
  image: 'registry-intl-vpc.ap-southeast-1.aliyuncs.com/measiagroup/mekhai:latest'
  ports:
    - '9911:9000/tcp'
  restart: always
  labels:
    aliyun.scale: '1'
  volumes:
    - 'mekhai-website:/usr/share/nginx/html/:rw'
  links:
    - redis
    - memcached
  memswap_limit: 0
  shm_size: 0
  memswap_reservation: 0
  kernel_memory: 0
  name: php
redis:
  image: 'redis:3.2.11-alpine'
  restart: always
  environment:
    - 'REDIS_DOWNLOAD_URL=http://download.redis.io/releases/redis-3.2.11.tar.gz'
    - REDIS_DOWNLOAD_SHA=31ae927cab09f90c9ca5954aab7aeecc3bb4da6087d3d12ba0a929ceb54081b5
  expose:
    - '6311:6379'
  labels:
    aliyun.scale: '1'
  volumes:
    - /data
memcached:
  image: 'memcached:latest'
  ports:
    - '11011:11211'
  restart: always
  labels:
    aliyun.scale: '1'
