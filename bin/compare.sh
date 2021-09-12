#!/bin/bash

directory=$(pwd)
user=$(id -u)
group=$(id -g)
cmd="compare ${@}"

docker run --workdir /app \
  --volume "${directory}":/app \
  --user "${user}:${group}" \
  -t \
  njmyers/image-magick "${cmd}"
