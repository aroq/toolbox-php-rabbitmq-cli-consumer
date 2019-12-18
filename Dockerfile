FROM michaeltigr/toolbox-php:7.2-0.1.11.3

RUN apk add --no-cache supervisor

ENV RABBITMQ_CLI_CONSUMER_VERSION 2.3.3
RUN curl --fail -sSL -o mq.tar.gz https://github.com/corvus-ch/rabbitmq-cli-consumer/releases/download/${RABBITMQ_CLI_CONSUMER_VERSION}/rabbitmq-cli-consumer_${RABBITMQ_CLI_CONSUMER_VERSION}_linux_amd64.tar.gz  \
    && tar -zxf mq.tar.gz \
    && mv rabbitmq-cli-consumer /usr/local/bin/ \
    && rm -f mq.tar.gz

CMD ["/usr/bin/supervisord", "-c", "/var/www/html/docker/supervisord.conf"]
