FROM hypriot/rpi-alpine

ARG subliminal_version

RUN apk update \
    && apk upgrade \
    && apk add bash \
    && apk add python3 \
    && apk add py-pip \
    && pip install --upgrade pip \
    && pip install pytest-runner \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /usr/src/app /usr/src/cache

WORKDIR /usr/src/app

VOLUME /usr/src/cache

COPY . /usr/src/app

RUN pip install --no-cache-dir subliminal==$subliminal_version

ENTRYPOINT ["subliminal", "--cache-dir", "/usr/src/cache"]

CMD ["--help"]