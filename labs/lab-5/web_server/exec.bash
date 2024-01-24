#!/usr/bin/env bash

container_name=$(docker container ls -f ancestor=web_server --format={{.Names}})

if [[ $container_name ]]; then
    docker exec -it $container_name bash
else
    echo "The container was not found"
fi
