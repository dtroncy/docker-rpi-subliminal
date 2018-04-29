FROM hypriot/rpi-alpine-scratch

RUN apk update && \
    apk upgrade && \
    apk add bash && \
    apk add python3 && \
    apk add py-pip && \
    pip install --upgrade pip && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /usr/src/app /usr/src/cache

WORKDIR /usr/src/app

VOLUME /usr/src/cache

#COPY . /usr/src/app

RUN pip install --trusted-host pypi.python.org --no-cache-dir subliminal

ENTRYPOINT ["subliminal", "--cache-dir", "/usr/src/cache"]

CMD ["--help"]