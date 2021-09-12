#!/bin/bash

if [ $# -ge 2 ]; then
  arguments=$(($# - 2))
  options=${@:1:$arguments}
  input="${@: -2:1}"
  output="${@: -1:1}"

  docker run -i njmyers/image-magick "convert ${options} - -" <${input} >${output}
else
  docker run -i njmyers/image-magick "convert ${@}"
fi
