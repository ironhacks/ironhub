# Build as jupyterhub/singleuser
# Run with the DockerSpawner in JupyterHub

ARG BASE_IMAGE=jupyter/datascience-notebook
FROM $BASE_IMAGE
MAINTAINER Project Jupyter <jupyter@googlegroups.com>

ADD master.tar.gz /tmp/

ADD install.sh /tmp/install.sh

ARG JUPYTERHUB_VERSION=master

# install pinned jupyterhub and ensure notebook is installed

#RUN python3 /tmp/install_jupyterhub && \
#    python3 -m pip install notebook

RUN sh /tmp/install.sh
