FROM alpine:3.14 AS packages

## Add Library Dependencies ##
RUN apk add --no-cache \
  tar \
  wget \
  make \
  g++ \
  libltdl \
  libtool \
  libwebp \
  libwebp-dev \
  libjpeg-turbo \
  libjpeg-turbo-dev \
  libpng \
  libpng-dev \
  openjpeg \
  openjpeg-dev

FROM packages AS builder

## Compile ImageMagick ##
WORKDIR /tmp
RUN wget https://imagemagick.org/download/ImageMagick.tar.gz \
      --no-check-certificate && \
    tar xvzf ImageMagick.tar.gz && \
    rm ImageMagick.tar.gz && \
    cd $(ls | grep ImageMagick) && \
    ./configure \
      --with-modules \
      --enable-shared \
      --with-perl && \
    make && \
    make install && \
    rm -rf /tmp/*

## Clean Executable ##
FROM alpine:3.14 AS executable

COPY --from=builder /usr /usr
COPY --from=builder /bin /bin

WORKDIR /app
ENTRYPOINT ["sh", "-c", "--"]
