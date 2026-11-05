# CM2003 Lab 1: Neural networks from scratch

## Setting up the environment

This lab only uses NumPy and a few scientific Python packages (no deep learning framework).
You need two things:

1. **A Python environment** with the packages in `requirements.txt` / `environment.yml`.
2. **The CIFAR-10 dataset** (about 170 MB) in `cm2003/datasets/cifar-10-batches-py/`. It is not
   included in the repository; `python download_data.py` gets it for you (on MAIA from the
   course's shared folder, elsewhere from the CIFAR-10 website).

Pick **one** of the options below.

### Option 1: On MAIA (recommended)

Your MAIA workspace already has a ready-made environment called **`DL_labs_GPU`**, so there is
nothing to install.

1. Open a terminal in JupyterLab (*File > New > Terminal*) and clone your repository:
   ```bash
   git clone <your-repository-url>
   cd <your-repository-folder>
   ```
2. Get the dataset. On MAIA this copies it from the course's shared folder, so it only takes a
   few seconds:
   ```bash
   python download_data.py
   ```
3. Open a notebook (start with `simple_nn.ipynb`) and select the kernel **DL_labs_GPU**
   (*Kernel > Change Kernel...*). If it is not in the list, refresh the browser tab.

Working over SSH or in VS Code instead? Activate the environment in the terminal with
`conda activate DL_labs_GPU`, and select `DL_labs_GPU` as the Python interpreter/kernel in VS Code.

### Option 2: On your own computer with conda

1. Install [Miniforge](https://github.com/conda-forge/miniforge) (a minimal conda that uses the
   free conda-forge channel). Any existing Anaconda/Miniconda installation also works.
2. In a terminal (on Windows: the *Miniforge Prompt*), go to the repository folder.
3. **macOS / Linux:** run the setup script. It creates the conda environment `cm2003-lab1`,
   registers it as a Jupyter kernel called *CM2003 Lab 1* and downloads the dataset:
   ```bash
   ./setup.sh
   ```
   **Windows:** run the same steps by hand:
   ```bash
   conda env create -f environment.yml
   conda activate cm2003-lab1
   python -m ipykernel install --user --name=cm2003-lab1 --display-name "CM2003 Lab 1"
   python download_data.py
   ```
4. Start Jupyter (or VS Code), open a notebook and select the kernel **CM2003 Lab 1**.

Next time, activate the environment with `conda activate cm2003-lab1`.

> If `conda env create` stops with a *Terms of Service* error (newer Anaconda/Miniconda
> installations), use the `conda create` line from `setup.sh` instead, which only uses conda-forge:
> `conda create -n cm2003-lab1 --override-channels -c conda-forge python=3.12 numpy=1.26.4 scipy=1.14.0 matplotlib=3.8.4 pandas=2.2.2 scikit-learn=1.5.1 imageio=2.35.0 future six ipykernel`

### Option 3: On your own computer with uv

[uv](https://docs.astral.sh/uv/) is a fast alternative to conda/pip. Install it by following
[the uv installation guide](https://docs.astral.sh/uv/getting-started/installation/), then, in the
repository folder:

```bash
uv venv --python 3.12                 # creates the environment in .venv/ (uv downloads Python 3.12 if needed)
uv pip install -r requirements.txt    # installs the lab packages into .venv/
uv run python -m ipykernel install --user --name=cm2003-lab1 --display-name "CM2003 Lab 1"
uv run python download_data.py
```

`uv run <command>` runs a command inside the `.venv` environment without activating it. To
activate it in your terminal instead: `source .venv/bin/activate` (macOS / Linux) or
`.venv\Scripts\activate` (Windows). Then open a notebook and select the kernel **CM2003 Lab 1**.
In VS Code, you can also pick `.venv` directly as the Python interpreter.

### Check that it works

Run the first cells of `simple_nn.ipynb` (no dataset needed) and of `two_layer_net.ipynb`
(loads CIFAR-10). If both run without errors, you are ready.

### Troubleshooting

- **The kernel does not show up in Jupyter:** refresh the browser tab. For your own environment,
  re-run the `ipykernel install` command from your option above.
- **`FileNotFoundError` mentioning `cifar-10-batches-py`:** the dataset is missing. Run
  `python download_data.py` (with your environment's Python) from the repository folder.
- **`ModuleNotFoundError`:** the notebook is using the wrong kernel. Check the kernel name in the
  top-right corner of the notebook (*DL_labs_GPU* on MAIA, *CM2003 Lab 1* on your own computer).

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


 
