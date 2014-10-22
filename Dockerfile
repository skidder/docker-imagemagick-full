# ImageMagick-Full
# Author:     Sean Matheson
# Version:    0.0.1
# Repo:       https://bitbucket.org/acleancoder/imagemagick-full
# Docker Hub: https://registry.hub.docker.com/u/acleancoder/imagemagick-full/

FROM ubuntu:14.04

# This prevents us from get errors during apt-get installs as it notifies the
# environment that it is a non-interactive one.
ENV DEBIAN_FRONTEND noninteractive

# TRUSTY-BACKPORTS
# We all the trusty-backports source as this will give us access to a povray
# package.  Not having to build this package from source great decreases the
# final size of the container.
RUN \
  echo "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list

# POVRAY
RUN \
  apt-get update && \
  # These packages are directly required/recommended for imagemagick
  apt-get -y install povray && \
  rm -rf /var/lib/apt/lists/*

# FFMPEG
# We install ffmpeg using a respected PPA by Jon Severinsson.  This PPA is
# well maintained and recommended by the official ffmpeg website.  It builds
# ffmpeg in a shared library mode with all it's dependencies included.
RUN \
  apt-get update && \
  apt-get -y install software-properties-common && \
  apt-add-repository -y ppa:jon-severinsson/ffmpeg && \
  apt-get update && \
  apt-get -y install ffmpeg && \
  rm -rf /var/lib/apt/lists/*

# IMAGEMAGICK
RUN \
  apt-get update && \
  # Install all the recommended and suggested packages for ImageMagick
  apt-get -y install ghostscript libmagickcore5-extra netpbm autotrace \
    cups-bsd curl enscript gimp grads groff-base hp2xx \
    html2ps libwmf-bin mplayer radiance sane-utils \
    texlive-base-bin transfig ufraw-batch xdg-utils && \
  # Install ImageMagick itself
  apt-get -y install gnuplot imagemagick-doc imagemagick
  rm -rf /var/lib/apt/lists/*
