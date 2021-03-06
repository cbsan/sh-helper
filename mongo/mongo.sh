#!/bin/bash

###########################################################
# Helper for use container mongo in development environment #
###########################################################

CONTAINERNAME="helper_mongo"
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
    docker run -itd --name "$CONTAINERNAME" -v "$VOLUMENOW":/usr/src/app  -v ~/.ssh:/root/.ssh -w /usr/src/app mongo /bin/bash > /dev/null
fi

docker exec "$CONTAINERNAME" mongo $COMMANDEXEC