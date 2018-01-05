#!/bin/bash -
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

copyDir="/media/usb/docker-mldonkey"
while read ss
do
    #ssh -n $ss "apt-get update && apt-get install realpath"
    ./copy.sh "$ss" "$copyDir"
    ssh -n $ss "$copyDir/run.sh"
done < deploy.list
