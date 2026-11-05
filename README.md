# CM2003 Lab 1: Neural networks from scratch

## Setting up the environment

All code in this lab uses NumPy (no deep learning framework), so the environment is small.
It is defined in `environment.yml` (conda environment `cm2003-lab1`, Python 3.12).

### On MAIA (JupyterHub)

Activate the DL-Labs-GPU

### On your own computer

Install [Miniforge](https://github.com/conda-forge/miniforge) (or any conda installation), then run
`./setup.sh` from the repository folder as above. On Windows, run the commands in `setup.sh` by hand
in the Miniforge Prompt:
```bash
conda create -n cm2003-lab1 --override-channels -c conda-forge python=3.12 numpy=1.26.4 scipy=1.14.0 matplotlib=3.8.4 pandas=2.2.2 scikit-learn=1.5.1 imageio=2.35.0 future six ipykernel
conda activate cm2003-lab1 
python -m ipykernel install --user --name=cm2003-lab1 --display-name "CM2003 Lab 1"
```
and download CIFAR-10 from https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz, extracting it into
`cm2003/datasets/` so that the folder `cm2003/datasets/cifar-10-batches-py/` exists.

### Troubleshooting

- *Kernel "CM2003 Lab 1" does not show up:* refresh the browser tab, or re-run
  `python -m ipykernel install --user --name=cm2003-lab1 --display-name "CM2003 Lab 1"` with the
  environment activated.
- *`FileNotFoundError` for `cifar-10-batches-py`:* the dataset is missing; re-run `./setup.sh`.

## Goals

In this assignment you will practice putting together a simple image classification pipeline based on the k-Nearest Neighbor or the Softmax classifier. The goals of this assignment are as follows:


Understand basic neural network architecture.
Understand the basic Image Classification pipeline and the data-driven approach (train/predict stages).
Understand the train/val/test splits and the use of validation data for hyperparameter tuning.
Develop proficiency in writing efficient vectorized code with numpy.
Implement and apply a Two layer neural network classifier.


Q1: Simple neural network example

Go through the notebook and complete the exercises

Q2: Two-Layer Neural Network

The notebook two_layer_net.ipynb will walk you through the implementation of a two-layer neural network classifier. 


### Extra (optional for extra practice):
* k-Nearest Neighbor classifier

The notebook knn.ipynb will walk you through implementing the kNN classifier.

* Implement a Softmax classifier (Optional)

The notebook softmax.ipynb will walk you through implementing the Softmax classifier.

### What to hand in:
* Code on Github
* Short report answering questions from the code (hand-written or computer-written)
* Hand-written derivations for the implementations of the: Affine-forward, Affine-backward, ReLU forward, ReLU-backward.


 
