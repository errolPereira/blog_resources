#!/bin/bash

# Add PPA drivers
sudo add-apt-repository ppa:graphics-drivers/ppa

# Install Nvidia drivers
sudo apt install -y nvidia-driver-470

# Creating conda environment
source ~/anaconda3/etc/profile.d/conda.sh
conda create -y --name tensorflow python=3.9

# Activate conda env
conda activate tensorflow

# Install Cuda and CuDNN
conda install -y -c conda-forge cudatoolkit=11.2 cudnn=8.1.0

# Expot Path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/

# Upgrading pip and installling tensorflow 2.x
pip3 install --upgrade pip
pip3 install tensorflow

# Test installation
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
