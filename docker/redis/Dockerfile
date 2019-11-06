FROM redis:5.0.5
MAINTAINER dairh "342751099@qq.com"

ENV TIMEZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

RUN mkdir -p /var/log/redis

COPY ./redis.conf /etc/redis.conf
CMD ["redis-server","/etc/redis.conf"]