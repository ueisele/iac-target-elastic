#!/usr/bin/env bash
set -e
pushd . > /dev/null
cd $(dirname ${BASH_SOURCE[0]})
DIR_SCRIPTS=$(pwd)
source ./docker-compose.sh
popd > /dev/null

function main () {
    start_service "elasticsearch"
    start_service "kibana"
}

function start_service () {
    docker_compose_in_environment up -d $1
}

main
