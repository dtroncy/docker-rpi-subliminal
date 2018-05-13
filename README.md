# docker-rpi-subliminal

[![Build Status](https://travis-ci.org/dtroncy/docker-rpi-subliminal.svg?branch=master)](https://travis-ci.org/dtroncy/docker-rpi-subliminal)

This is a raspberry pi compatible Subliminal DockerFile.

To build it :

    docker build --build-arg subliminal_version=$subliminal_version -t rpi-subliminal .

$subliminal_version is version of subliminal you want to install.

To run it (Official example) :

    docker run --rm --name subliminal -v subliminal_cache:/usr/src/cache -v /tvshows:/tvshows -it dtroncy/rpi-subliminal download -l en /tvshows/The.Big.Bang.Theory.S05E18.HDTV.x264-LOL.mp4

Description of parameters :
  - **--rm** : automatically clean up the container and remove the file system when the container exits
  - **--name subliminal** : container's name
  - **-v subliminal_cache:/usr/src/cache** : mount cache folder in your container to a folder in your host
  - **-v /tvshows:/tvshows** : mount tvshows folder in your container to a folder in your host
  - **-it** : allocate a tty for the container process
  - **dtroncy/rpi-subliminal** : image's name
  - **download -l en /tvshows/The.Big.Bang.Theory.S05E18.HDTV.x264-LOL.mp4** : download english subtitles for indicated file