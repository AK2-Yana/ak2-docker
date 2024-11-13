#!/bin/sh
for i in {7000..7005}; do
  mkdir -p /data/$i;
  sed "s/\${PORT}/$i/g" /conf/redis.conf.template > /data/${i}/redis.conf;
    redis-server /data/${i}/redis.conf
done    

sleep 5

redis-cli --cluster create \
    127.0.0.1:7000 \
    127.0.0.1:7001 \
    127.0.0.1:7002 \
    127.0.0.1:7003 \
    127.0.0.1:7004 \
    127.0.0.1:7005 \
    --cluster-replicas 1 \
    --cluster-yes

sleep 30