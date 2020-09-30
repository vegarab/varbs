#!/bin/bash
packer -S miniconda3 --noconfirm
mkdir -p /usr/etc/profile.d/
sudo ln -s /usr/etc/profile.d/conda.sh /etc/profile.d/conda.sh 
conda activate
