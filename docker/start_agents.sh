#!/usr/bin/env bash

docker-compose down

docker-compose up \
    --no-attach agent1 \
    --no-attach agent2 \
    --no-attach agent3 \
    --no-attach agent4