#!/bin/bash
let PORTT=8080
if ! [ -z $1 ]
then
    #echo "given $1"
    if [ "$1" -gt 1023 ] && [ "$1" -lt 65535 ]
    #[ $1 > 1023 $1 < 65535]
    then
        let PORTT=$1
        #echo "new port $PORT"
    fi
fi

#echo "still port $PORT"
PORT=$PORTT node index.js 
