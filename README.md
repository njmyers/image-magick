# Dockerized Image Magick

This is a dockerized version of image magick which is precompiled with additional codec support.

## Scripts

For ease of use feel free to use the commands located in `bin`. 

Each command is a shell around the normal image magick commands. The commands add support for docker volumes based on the current context as well as correct argument parsing and file permission management within the container.
