#!/bin/bash
packer -S python-conda --noconfirm
mkdir -p /usr/etc/profile.d/
sudo ln -s /usr/etc/profile.d/conda.sh /etc/profile.d/conda.sh 
conda activate
