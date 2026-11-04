#!/bin/bash
# Sets up everything needed for Lab 1:
#   1. the conda environment "cm2003-lab1" (see environment.yml)
#   2. a Jupyter kernel with the same name
#   3. the CIFAR-10 dataset in cm2003/datasets/
set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
ENV_NAME=cm2003-lab1

source "$(conda info --base)/etc/profile.d/conda.sh"

# Packages listed under "dependencies:" in environment.yml. Installed with conda-forge only
# (--override-channels), so Anaconda's "defaults" channel and its Terms of Service prompt are not used.
PACKAGES=$(sed -n '/^dependencies:/,$p' environment.yml | grep -E '^ +- ' | sed -E 's/^ +- //')

if conda env list | grep -qE "^${ENV_NAME} |/${ENV_NAME}$"; then
  echo "Environment ${ENV_NAME} already exists, making sure all packages are installed"
  conda install -y -n "$ENV_NAME" --override-channels -c conda-forge $PACKAGES
else
  conda create -y -n "$ENV_NAME" --override-channels -c conda-forge $PACKAGES
fi

conda activate "$ENV_NAME"
python -m ipykernel install --user --name="$ENV_NAME" --display-name "CM2003 Lab 1"

# Dataset
cd cm2003/datasets
if [ ! -d cifar-10-batches-py ]; then
  wget -q --show-progress http://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz -O cifar-10-python.tar.gz
  tar -xzf cifar-10-python.tar.gz
  rm cifar-10-python.tar.gz
fi

echo
echo "Setup complete! In Jupyter, select the kernel \"CM2003 Lab 1\" (Kernel > Change kernel)."
