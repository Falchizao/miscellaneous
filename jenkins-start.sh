#!/bin/bash

current_dir=$(pwd)

cd src/main/docker

compose_file="docker-compose.yml"

if [ -f "docker-compose.yml" ]; then
    docker-compose -f "$compose_file" down
    docker compose up -d

    cd "$current_dir"

    cd web

    if [ -f "docker-compose.yml" ]; then
        docker-compose -f "$compose_file" down
    	docker compose up -d
    fi
else
    echo "Error: docker-compose.yml not found in api folder."
    exit 1
fi


