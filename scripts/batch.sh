#!/bin/bash

while read -r CONTAINER; do
  echo "Extracting home directory contents from: ${CONTAINER}"
  ./get-docker-homedir.sh "${CONTAINER}"
done < ../container_list.txt
