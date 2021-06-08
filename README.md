# ZZSN_joint_repos

This repository contains two repositories for artistic style transfer. Here, we would like to consider them as tools for weather change on pictures.

## Installation

### style-transfer-pytorch

Detailed description is included in the ./style-transfer-pytorch folder, which is a copy (01.06.2021) of the repository: https://github.com/crowsonkb/style-transfer-pytorch.

Important: In both repositories, make sure to use python virtual environment during installation and execution of scripts.

Requirements:

- Python 3.6+

To install: python3 -m pip install -e ./style-transfer-pytorch

### a-neural-algorithm-of-artistic-style

Detailed description is included in the ./a-neural-algorithm-of-artistic-style folder, which is a copy (01.06.2021) of the repository: https://github.com/tjwhitaker/a-neural-algorithm-of-artistic-style

Requirements:

- Python 3.6+
- PyTorch 1.0
- Pillow 5.3
- Matplotlib 3.0

## Image scapping

We have made two scripts for image scrapping from public webcams: https://www.webcamgalore.com

Installation and usage is described in their folder readme's.

## Image classification

To classify images as cloudy or sunny, we used Two-class Weather Classification (http://www.cse.cuhk.edu.hk/leojia/projects/weatherclassify/index.htm)

Downloaded images are classified as cloudy or sunny, and put into respective folders.
Additional MatLab script was made to make sure that both folders retain same size.
