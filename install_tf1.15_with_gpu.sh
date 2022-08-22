#!/bin/bash

# Add PPA drivers
#sudo add-apt-repository ppa:graphics-drivers/ppa

# Install Nvidia drivers
#sudo apt install -y nvidia-driver-470

# Creating conda environment
source ~/anaconda3/etc/profile.d/conda.sh
conda create -y --name tensorflow_gpu python=3.6.5

# Activate conda env
conda activate tensorflow_gpu

# Install Cuda and CuDNN
conda install -y -c conda-forge cudatoolkit=10.0 cudnn=7.3.1

# Expot Path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/

# Upgrading pip and installling tensorflow 2.x
pip3 install --upgrade pip
pip3 install tensorflow-gpu==1.15

# Test installation
python3 -c "import tensorflow as tf; print(tf.test.is_gpu_available(cuda_only=False, min_cuda_compute_capability=None))"
