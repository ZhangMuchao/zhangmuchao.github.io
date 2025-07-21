---
title: Latex Template IST-UL
date: 2025-07-21 15:49:05
categories: [Tools and Skills, Skills]
tags: [latex, thesis, template]     # TAG names should always be lowercase
description: [Instituto Superior Técnico, ULisboa] Thesis template? Master? PhD?.
toc: true
math: true
---

##  Online template files using LaTex.

### Sources
[Available LaTeX templates 1](https://mdo.tecnico.ulisboa.pt/templates/)
> MSc thesis / PhD dissertation.

> Extend abstract

> Presentation

[Available LaTex templates 2](https://fenix.tecnico.ulisboa.pt/homepage/ist31052/documentos-para-elaboracao-da-tese)

### How to use?

#### 1. Recommend architecture

```
my-thesis/
│
├── thesis.tex              ← main document
├── istulthesis.cls         ← class
├── mysettings.sty          ← self-defined style (Optional)
├── chapters/
│   ├── intro.tex
│   └── methods.tex
├── images/
│   └── figure1.png
├── bibliography.bib

```

#### 2. Use the template

```
\documentclass[twoside]{istulthesis}  % 使用 IST 的样式类

% 可选配置：
\usepackage{mysettings}               % 如果你有自己的 .sty 文件
\usepackage{graphicx}
\usepackage{amsmath, amssymb}
\bibliographystyle{ieeetr}

\begin{document}

\title{Your Thesis Title}
\author{Your Name}
\date{July 2025}

\maketitle

\include{chapters/intro}
\include{chapters/methods}

\bibliography{bibliography}

\end{document}

```

#### 3. Compile and Modify