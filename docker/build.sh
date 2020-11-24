#!/bin/bash

IMAGE_VERSION="2"

docker build -t "ironhub-v${IMAGE_VERSION}" .
