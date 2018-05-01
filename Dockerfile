FROM hypriot/rpi-alpine-scratch

ARG subliminal_version

#RUN apk update
    
#RUN apk upgrade

RUN apk add bash

RUN apk add python3

RUN apk add py-pip

RUN pip install --upgrade pip

RUN pip install pytest-runner

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /usr/src/app /usr/src/cache

WORKDIR /usr/src/app

VOLUME /usr/src/cache

COPY . /usr/src/app

RUN pip install --no-cache-dir subliminal==$subliminal_version

ENTRYPOINT ["subliminal", "--cache-dir", "/usr/src/cache"]

CMD ["--help"]