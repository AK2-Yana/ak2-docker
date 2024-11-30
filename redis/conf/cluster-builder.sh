#!/bin/sh
for i in {7001..7006}; do
  mkdir -p /data/$i;
  sed "s/\${PORT}/$i/g" /conf/redis.conf.template > /data/${i}/redis.conf;
  redis-server /data/${i}/redis.conf
done    

redis-cli --cluster create \
    127.0.0.1:7001 \
    127.0.0.1:7002 \
    127.0.0.1:7003 \
    127.0.0.1:7004 \
    127.0.0.1:7005 \
    127.0.0.1:7006 \
    --cluster-replicas 1 \
    --cluster-yes

tail -f /dev/null