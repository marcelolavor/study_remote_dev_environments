#!/usr/bin/env bash
set -e

sudo apt update && sudo apt upgrade -y
sudo apt install curl wget -y

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
checksum=$(sha256sum Miniconda3-latest-Linux-x86_64.sh | awk '{print $1}')
wget -O index.html https://repo.anaconda.com/miniconda/
echo "$index=$(grep -F "$checksum" index.html >/dev/null && echo verified)"
grep -q "$checksum" index.html || { echo "Hash mismatch"; exit 1; }

chmod +x Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p "$HOME/miniconda3"

eval "$("$HOME/miniconda3/bin/conda" shell.bash hook)"
conda config --set auto_activate_base true
conda install -n base conda-anaconda-tos -y

conda config --set plugins.auto_accept_tos yes
export CONDA_PLUGINS_AUTO_ACCEPT_TOS=yes

conda update -n base conda -y
