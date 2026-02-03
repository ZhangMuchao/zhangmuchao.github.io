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
│
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





torch gpu version: RTX G5070
pip uninstall torch torchvision torchaudio -y

pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128
python中像matlab绘图的那种比较方便的函数如何调用？有哪些库？