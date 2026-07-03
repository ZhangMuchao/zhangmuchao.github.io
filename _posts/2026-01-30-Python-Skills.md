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

### Pycharm

#### Project
新建工程后如果该工程创建的虚拟环境需要给其他工程使用，需要取消勾选将环境与该项目关联。


### Machine Learning

#### Train loss vs Validation loss

During the training process, the variation/gap between "train loss" and "val loss" is an important indicator for judging the model's fitting status and generalization ability.

1. Both losses decrease with a small gap (Ideal)

Meaning: The model is learning patterns from the training data while generalizing well to unseen validation data.

Indicates: Normal training; model capacity matches data complexity.

2. Train loss is much lower than val loss (Large gap)
This is the most common scenario requiring attention. It can be further divided into:

a. Overfitting

Pattern: Train loss continues to drop (sometimes near zero), while val loss plateaus or increases after a certain point.

Meaning: The model memorizes noise and details from the training data, failing to generalize.

Possible reasons:

* Model too complex (too many parameters)
* Insufficient or non-diverse training data
* Too many training epochs (early stopping not applied)
* Insufficient regularization (e.g., dropout, weight decay)


b. Data distribution mismatch

Pattern: From the start of training, val loss is significantly higher than train loss.

Meaning: Training and validation sets may come from different distributions (e.g., non-random split, data leakage, or inconsistent preprocessing).

3. Both losses are high with a small gap

Meaning: The model is underfitting.

Indicates: The model fails to learn the underlying patterns in the training data.

Possible reasons:

* Model too simple
* Insufficient training (low learning rate, too few epochs)
* Poor feature engineering


4. Train loss is higher than val loss (Uncommon)
Meaning: Often indicates that the validation set is easier, or the training data contains more noise/outliers.

Alternatively: Regularization may be too strong, limiting training performance but improving generalization.

5. Both losses decrease, but the gap widens over time
Meaning: Early signs of overfitting.

Response: Consider early stopping, increasing regularization, or adding data augmentation.

**How to Use This Gap to Guide Training**

* Focus on the trend of the gap, not just absolute values.
* Use early stopping: stop training when val loss stops improving or starts increasing.
* Adjust model capacity: reduce complexity or increase regularization when overfitting; increase capacity when underfitting.
* Check data quality: ensure train/val sets come from the same distribution and there is no data leakage.
