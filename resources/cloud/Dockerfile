FROM elixir:1.16.2-otp-26-alpine

ENV USER=root
ENV APP_NAME=api_clean
ENV REPLACE_OS_VARS=true

WORKDIR /app
EXPOSE 8083

RUN apk update && apk upgrade && apk add bash && mkdir -p /app/rel/$APP_NAME/var && chown -R $USER:$USER /app/rel/$APP_NAME/

COPY api_clean-0.1.0.tar.gz .
RUN tar -xzf api_clean-0.1.0.tar.gz -C /app/ \
    && rm -f api_clean-0.1.0.tar.gz \
    && ls -Rl /app

RUN chmod -R +x /app

VOLUME /app/rel/$APP_NAME/etc
USER $USER

ENTRYPOINT ["/app/bin/api_clean", "start"]