#!/usr/bin/env bash

function build_image_if_not_exist() {
    images_count=$(docker images -a | grep -c $1)

    if [[ $images_count == 0 ]]; then
        echo "Image not found. Starting to build an image"
        bash build.bash
        echo "The image has been successfully built"
    fi
}

function parse_container_name() {
    if [[ $1 ]]; then
        echo "--name $1"
    fi
}

function run_container() {
    local image_name=$1
    local container_name=$(parse_container_name $2)

    build_image_if_not_exist $image_name

    docker run  -it         \
                -it         \
                --rm        \
                -p 80:80    \
                $container_name \
                $image_name \
                bash
}

IMAGE_NAME="web_server"
CONTAINER_NAME=$1

run_container $IMAGE_NAME $CONTAINER_NAME