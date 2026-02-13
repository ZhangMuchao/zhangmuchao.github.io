---
title: Python - Basic
date: 2026-01-30 18:21:31
categories: [Tools and Skills, Skills]
tags: [python]     # TAG names should always be lowercase
description: python.
toc: true
math: true
---

## Commands and skills

### Requirements
This command saves all installed packages and their versions to a requirements file.
```python
# export
pip freeze > requirements.txt
# recreate: recommeded to creat a fresh virtual environment
pip install -r requirements.txt
```

### Project Organization Strategy
During the exploration phase of a project, multiple Python projects are usually created to test different ideas or approaches. Although these projects are separate, they usually use the same virtual environment, and rely on many common utility functions. 

To improve maintainability and code reuse, it is recommended to organize all related projects inside one workspace directory and create a shared local library.

```
# one shared environment + one shared library + many lightweight projects
workspaceName/
│
├── lib/
│   ├── .venv/          # shared virtual environment
│   ├── mytools/        # shared reusable code
│   └── setup.py
├── data/
│   ├── mat/           # original .mat
│   ├── npz/           # npz (loaded)
│   └── cache/         
├── project_ideaA/
├── project_ideaB/
└── project_ideaC/
```
#### 1. Creat virtual environment
```
Name:               lib
Location:           E:\workspaceName
Interpreter type:   Project venv
Python version:     Python 3.11.9
```
#### 2. Install necessary packages
#### 3. Creat python package
```
RightClikc >> New >> Python Package
```
#### 4. Creat "pyproject.toml"
```
[project]
name = "mytools"
version = "0.1.0"
description = "Shared research utilities"
authors = [{name="Your Name"}]
dependencies = []

[build-system]
requires = ["setuptools"]
build-backend = "setuptools.build_meta"
```


#### 5. Editable install
```
# install
pip install -e .

# confirmation
pip list
```

The following outputs can be obtained if the installation is success.
```
Package    Version Editable project location
---------- ------- -------------------------------
mytools    0.1.0   E:\PythonProjectLRR_Feb2026\lib
```
#### 6. Index
```
"mytools" >> RightClick >> Make Dictionary as >> Source root
```

### 分段执行pycharm
```
#%%
```

### Specific version "torch" for the PC-Laser
```
# torch gpu version: RTX G5070
# uninstall the previous version
pip uninstall torch torchvision torchaudio -y
# install the correct version
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128

# code to check
import torch

print(torch.cuda.is_available())      # True / False
print(torch.cuda.device_count())      # GPU#
print(torch.cuda.get_device_name(0))  # the name of the first device name

print(torch.__version__)
print(torch.version.cuda)
print(torch.cuda.get_arch_list())

# The output
True
1
NVIDIA GeForce RTX 5070
2.11.0.dev20260203+cu128
12.8
['sm_75', 'sm_80', 'sm_86', 'sm_90', 'sm_100', 'sm_120']
```
### Matlab and Python

#### index and dimensions
