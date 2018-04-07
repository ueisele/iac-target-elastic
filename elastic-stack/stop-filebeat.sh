#!/usr/bin/env bash
set -e
DIR=$(cd $(dirname $0); pwd)
pushd . > /dev/null
cd $DIR
source ./docker-compose.sh
popd > /dev/null

function main () {
    stop_service "filebeatkafka1"
    stop_service "filebeatkafka2"
    stop_service "filebeatkafka3"
    stop_service "filebeatkafka4"
    stop_service "filebeatkafka5"
}

function stop_service () {
    docker_compose_in_environment rm -f -s $1
}

main