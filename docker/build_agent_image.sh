#!/usr/bin/env bash

(cd ..; docker build . -t agent:22230 -f docker/Dockerfile)