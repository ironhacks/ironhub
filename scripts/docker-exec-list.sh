#!/bin/bash
cat ./list | while read CONTAINER_NAME; do
  #docker exec "$CONTAINER_NAME" /opt/conda/bin/jupyter labextension list
  docker exec "$CONTAINER_NAME" /opt/conda/bin/jupyter labextension uninstall @jupyterlab/extensionmanager-extension
  #docker exec "$CONTAINER_NAME" /opt/conda/bin/jupyter lab build
done
