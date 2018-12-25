#!/bin/bash
packer -S python-conda --noconfirm
mkdir -p /usr/etc/profile.d/
sudo ln -s /etc/profile.d/conda.sh /usr/etc/profile.d/conda.sh
conda activate
