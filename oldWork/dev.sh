#!/bin/bash

# Notes
# - make repo
# - pull in dotfiles (parameterized?)
# - run installer
# Docker dev image. Make a universal command for it. Let it accept an arg for what
# dir you want to mount into "/wrkdir/" if nothing is passed in then just assume
# the dir where the command was ran from
# -- add dotfiles, not mount,
# -- set hostname based on arg or something
# -- set prompt background color based on host name or env variable or something
# -- move from dotfiles to dev dir and add tools # to path
# -- add a cmd line option to or not to include all the ami tools



###
# Variables
###

WORKDIR=/dev/dotfiles                  # or, maybe, pull from $1?
DOCKERFILE=/dev/dev-docker/Dockerfile  # or, maybe, pull from $2?


# Variable File
# this program will use defaults.. aka dir called from unless config file given
# - wokrking directory
# - Dockerfile
# - dotfiles repo
#   - Expects top level install.sh file or that an installfile line is added
#   specifically?
#   - Where possible, these vars should be passed in as build params.


############
# Functions
############


###
# Build Env
###
_build_container() {
# allow to pick between a few different docker files? or maybe provide a dockerfile name?

  docker build   \
  -t dotfilesdev \
  --build-arg NAME=$name_passed_in \
  --build-arg HTTP_PROXY=$http_proxy   \
  --build-arg http_proxy=$http_proxy   \
  --build-arg HTTPS_PROXY=$https_proxy \
  --build-arg https_proxy=$https_proxy \
  ./
    #-t dotfilesDev$(date -u +"%y%m%d%H%M%S") \
  #--build-arg NAME=$name_passed_in \
  #$@

}


###
# Start Container
###
_start_container() {
  docker run \
  -it \
  --rm \
  --name dev \
  --mount type=bind,source="$(pwd)",target=/dotfiles \
  dotfilesdev

#docker run -d -it --rm --name dev --mount type=bind,source="$(pwd)",target=/dotfiles dotfiledev
}


###
# clean up container
###
_cleanup_container() {
  docker container rm $(docker container ls -aq)
  docker rmi $(docker images -aq)
}


###
# Main
###
_main() {
# TODO: need to add control flow. since we obviously wont just call these every time

  #if $1 is build
	#if $1 is start
	#if $1 is 
  # - Build Env
  _build_container "${@}"
  # - Start Container
  _start_container "${@}"
  # - clean up container
  _cleanup_container "${@}"
}
