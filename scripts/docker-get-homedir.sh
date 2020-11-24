#!/bin/bash

CONTAINER_ID=${1}
DELETE_LIST=".bash*,.profile,.yarn,.npm,.local,.empty,.config,.cache,.conda"

[[ ! -d ${CONTAINER_ID} ]] && mkdir "${CONTAINER_ID}"
docker cp ${CONTAINER_ID}:/home/jovyan/ "./${CONTAINER_ID}"
rm -rf ./${CONTAINER_ID}/jovyan/${DELETE_LIST//,/ ./$CONTAINER_ID/jovyan/}
find "./${CONTAINER_ID}/jovyan" -mindepth 1 -maxdepth 1 -type d -ls -exec mv --no-clobber {} "./${CONTAINER_ID}/" \;
find "./${CONTAINER_ID}/jovyan" -mindepth 1 -maxdepth 1 -type f -ls -exec mv --no-clobber {} "./${CONTAINER_ID}/" \;
find "./${CONTAINER_ID}" -empty -delete
