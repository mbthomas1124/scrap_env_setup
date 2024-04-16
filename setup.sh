#!/bin/bash
eval "$(conda shell.bash hook)"

# directory from which the script is being run from
CURRENT_DIR="$( pwd )"

cd ~/scrap_env_setup

# create conda environment
mkdir temp_download
cd temp_download/
conda create -n rlsim python=3.7 anaconda -y
conda clean --all -y
conda activate rlsim

# install shift
wget https://github.com/hanlonlab/shift-python/releases/download/v2.0.1/shift_python-2.0.1-conda_linux.zip
unzip -j shift_python-2.0.1-conda_linux.zip
conda install *.bz2 -y
conda clean --all -y
cd ~/scrap_env_setup
rm -rf temp_download

# install pip packages
pip install -r requirements.txt

cd ~/scrap_env_setup

# verify that python env was setup properly
python test_env.py

# modify bashrc
echo 'conda activate rlsim"' >> ~/.bashrc

cd ${CURRENT_DIR}