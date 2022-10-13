#!/bin/bash


_rinstall() {
  PKGNAME=$1
  echo "install.packages(\"${pkg}\", repos=\"https://cran.rstudio.com\")" | R --no-save
}

echo "Installing Jupyterhub"

echo "Check python 3"

python -V

echo -e "\n\n"

echo -e "INSTALLING JUPYTER HUB PYTHON PACKAGES\n\n"

cd /tmp

python3 -m pip install ./jupyterhub-1.1.0
python3 -m pip install notebook
python3 -m pip install google.cloud google.oauth2 google-cloud-storage nbdime jupyterlab-git
python3 -m pip install google-cloud-bigquery
python3 -m pip install simpy


echo "devtools::install_github(\"r-dbi/bigrquery\")" | R --no-save

echo -e "INSTALLING JUPYTER LAB EXTENSION\n\n"

#jupyter labextension install @jupyterlab/google-drive
#jupyter labextension install @jupyterlab/github

jupyter labextension install jupyterlab-plotly

echo -e "\n\nREBUILDING JUPYTER LAB INSTANCE"

jupyter lab clean
jupyter lab build
