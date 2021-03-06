FROM dtroncy/rpi-alpine:3.12.0

ARG subliminal_version

RUN apk update \
    && apk upgrade \
    && apk add bash \
    && apk add python3 \
    && apk add py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install pytest-runner \
    && apk add unrar \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /usr/src/app /usr/src/cache

WORKDIR /usr/src/app

VOLUME /usr/src/cache

COPY . /usr/src/app

RUN pip3 install --no-cache-dir subliminal==$subliminal_version

ENTRYPOINT ["subliminal", "--cache-dir", "/usr/src/cache"]

CMD ["--help"]