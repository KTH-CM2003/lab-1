"""Get the CIFAR-10 dataset into cm2003/datasets/ (works on Linux, macOS and Windows).

On MAIA it is copied from the course's shared folder (~/shared/datasets); elsewhere it is
downloaded from the official CIFAR-10 website (about 170 MB).

Usage:  python download_data.py
"""
import shutil
import tarfile
import urllib.request
from pathlib import Path

URL = "https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz"
SHARED_COPY = Path.home() / "shared" / "datasets" / "cifar-10-batches-py"
DATASETS = Path(__file__).resolve().parent / "cm2003" / "datasets"
TARGET = DATASETS / "cifar-10-batches-py"


def main():
    if (TARGET / "data_batch_1").exists():
        print(f"CIFAR-10 is already there: {TARGET}")
        return
    DATASETS.mkdir(parents=True, exist_ok=True)

    if (SHARED_COPY / "data_batch_1").exists():
        print(f"Copying CIFAR-10 from {SHARED_COPY} ...")
        shutil.copytree(SHARED_COPY, TARGET)
    else:
        archive = DATASETS / "cifar-10-python.tar.gz"
        print(f"Downloading CIFAR-10 (about 170 MB) from {URL} ...")
        print("This can take a while if the server is busy.")
        urllib.request.urlretrieve(URL, archive)
        print("Extracting ...")
        with tarfile.open(archive) as tar:
            if hasattr(tarfile, "data_filter"):  # Python 3.12+: safe extraction
                tar.extractall(DATASETS, filter="data")
            else:
                tar.extractall(DATASETS)
        archive.unlink()
    print(f"Done: {TARGET}")


if __name__ == "__main__":
    main()
