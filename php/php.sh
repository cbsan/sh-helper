#!/bin/bash

###########################################################
# Helper for use container php in development environment #
###########################################################

CONTAINERNAME="helper_php7"
DIR=${PWD}
ROOTDIR=$(echo "$DIR" | cut -d "/" -f3)
CONTAINERNAME=$CONTAINERNAME"_"$ROOTDIR
FILELOADVOLUMENOW="/tmp/.dkr_load_volume_now_"$CONTAINERNAME
COMMANDEXEC="$@"

if [[ -z "$COMMANDEXEC" ]]; then
    COMMANDEXEC="-v"
fi

if [ ! -f "$FILELOADVOLUMENOW" ]; then
    echo $DIR > $FILELOADVOLUMENOW
    VOLUMENOW=$DIR
else
    VOLUMENOW=$(cat "$FILELOADVOLUMENOW")
fi

if [ ! $(docker ps -q -f status=running -f name="$CONTAINERNAME") ]; then
    
    if [ ! $(docker ps -aq -f name="$CONTAINERNAME" -f status=running) ]; then
        docker rm -f "$CONTAINERNAME" 2> /dev/null
    fi
    docker run -tid --name "$CONTAINERNAME" -v $VOLUMENOW:/var/www php:7-alpine3.7 > /dev/null
fi

docker exec "$CONTAINERNAME" php $COMMANDEXEC