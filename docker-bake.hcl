variable "IMAGE" {
  default = "njmyers/image-magick"
}

variable "TAG" {
  default = "local"
}

variable "CACHE_TAG" {
  default = "cache"
}

group "default" {
  targets = ["executable"]
}

group "cache-export" {
  targets = ["executable-cache", "packages-cache"]
}

target "packages" {
  target     = "packages"
  cache-from = ["type=registry,ref=${IMAGE}:${CACHE_TAG}"]
  output     = ["type=docker"]
}

target "executable" {
  inherits = ["packages"]
  target   = "executable"
  tags     = ["${IMAGE}:${TAG}"]
  output   = ["type=docker"]
}

target "packages-cache" {
  inherits = ["packages"]
  cache-to = ["type=registry,ref=${IMAGE}:${CACHE_TAG}"]
}

target "executable-cache" {
  inherits = ["executable"]
  cache-to = ["type=registry,ref=${IMAGE}:${CACHE_TAG}"]
}
