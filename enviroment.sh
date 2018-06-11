#!/bin/bash
# OS detection
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

# export is for testing
# in production place in /etc/enviroment or ~/.profile
export PUID=1000
export PGID=100
export TZ="Australia/Perth"
export USERDIR="~/docker"
export ROOT_PASSWORD="bitterpilot"

# Retrieve ip and export to temporary enviroment variable.
if [[ $platform == 'linux' ]]; then
    export IP="$(ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//' | awk '!/[a-z]/')"
elif [[ $platform == 'mac' ]]; then
    export IP="$(ipconfig getifaddr en0)"
fi

# TODO add a switch to direct export to permanent enviroment variables
docker-compose -f ~/Documents/docker/SupportServices/docker-compose.yml up -d