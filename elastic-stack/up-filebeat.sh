#!/usr/bin/env bash
set -e
pushd . > /dev/null
cd $(dirname ${BASH_SOURCE[0]})
DIR_SCRIPTS=$(pwd)
source ./docker-compose.sh
popd > /dev/null

function main () {
    start_service "filebeatkafka1"
    start_service "filebeatkafka2"
    start_service "filebeatkafka3"
    start_service "filebeatkafka4"
    start_service "filebeatkafka5"
}

function start_service () {
    docker_compose_in_environment up -d $1
}

main
