# ImageMagick Full #

### Index ###

1. Introduction
2. Build Details
3. Version History

----------

### 1. Introduction ###

This is an automated build *Docker Image* to configure a fully featured installation of ImageMagick (including all the recommended and suggested dependencies) on top of a base *Ubuntu 14.04* image.

It use apt-get as far as it possibly can to resolve these dependencies, and specific versions of each package is requested to further the stability of this automated Image build.

----------

### 2. Build Details ###

A completed build consists of the following components.

**2.1. Povray**

Upon writing of this file the *povray* package was only available in the *trusty-backports* sources.  Therefore this source has been added to the *sources.list* file.

povray version 3.7 will be installed.

**2.2. Ffmpeg**

To avoid building *ffmpeg* from source and bloating the build the high quality *Jon Severinsson Ffmpeg PPA* was identified as a candidate for the package source.

You can find details of it here: https://launchpad.net/~jon-severinsson/+archive/ubuntu/ffmpeg

This installs a fully featured version of *ffmpeg* with all of it's dependencies in shared library mode.

The installed ffmpeg configuration is:

* --arch=amd64
* --disable-stripping
* --enable-avresample
* --enable-pthreads
* --enable-runtime-cpudetect
* --extra-version='7:1.2.6-1~trusty1'
* --libdir=/usr/lib/x86_64-linux-gnu
* --prefix=/usr
* --enable-bzlib
* --enable-libdc1394
* --enable-libfreetype
* --enable-frei0r
* --enable-gnutls
* --enable-libgsm
* --enable-libmp3lame
* --enable-librtmp
* --enable-libopencv
* --enable-libopenjpeg
* --enable-libopus
* --enable-libpulse
* --enable-libschroedinger
* --enable-libspeex
* --enable-libtheora
* --enable-vaapi
* --enable-vdpau
* --enable-libvorbis
* --enable-libvpx
* --enable-zlib
* --enable-gpl
* --enable-postproc
* --enable-libcdio
* --enable-x11grab
* --enable-libx264
* --shlibdir=/usr/lib/x86_64-linux-gnu
* --enable-shared
* --disable-static
* libavutil
* libavcodec
* libavformat
* libavdevice
* libavfilter
* libswscale
* libswresample
* libpostproc

**2.3. ImageMagick**

All of the recommended and suggested packages are installed for ImageMagick as per the Ubuntu package details: http://packages.ubuntu.com/trusty/imagemagick

The installed ImageMagick will have the following delegates enabled:

* bzlib
* djvu
* fftw
* fontconfig
* freetype
* jbig
* jpeg
* jng
* jp2
* lcms2
* lqr
* lzma
* openexr
* pango
* png
* rsvg
* tiff
* x11
* xml
* wmf
* zlib

----------

### 3. Version History ###


**Version 0.0.2**

* FIXED: Curl package version.
* ADDED: Cleaning up of packages at end of script.

**Version 0.0.1**

* Initial commit.