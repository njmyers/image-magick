#!/bin/bash

directory=$(pwd)
user=$(id -u)
group=$(id -g)
cmd="magick-script ${@}"

docker run --workdir /app \
  --volume "${directory}":/app \
  --user "${user}:${group}" \
  -t \
  njmyers/image-magick "${cmd}"
