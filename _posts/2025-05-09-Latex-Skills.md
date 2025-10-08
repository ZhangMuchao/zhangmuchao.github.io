---
title: Latex Equations and Syntax
date: 2025-05-09 14:05:02
categories: [Tools and Skills, Skills]
tags: [latex]     # TAG names should always be lowercase
description: Equations for LATEX.
toc: true
math: true
---

## Multiline Equations

```
\begin{align}
E[V_b] &= \frac{1}{N}E\left[\sum_{t=1}^{N} (x(t)-\bar{x})^2\right] \\
       &= \frac{1}{N} E\left\{ \sum_{t=1}^{N}(x(t)-\mu)^2 - N(\bar{x}-\mu)^2 \right\} \\
       &= \frac{1}{N} \sum_{t=1}^{N}E[(x(t)-\mu)^2] - E(\bar{x}-\mu)^2 \\
       &= \frac{1}{N} \cdot N \cdot \sigma^2 - \frac{1}{N} \cdot \sigma^2 \\
       &= \left( \frac{N-1}{N} \right) \sigma^2
\end{align}
```
Result

$$
\begin{align}
E[V_b] &= \frac{1}{N}E\left[\sum_{t=1}^{N} (x(t)-\bar{x})^2\right] \\
       &= \frac{1}{N} E\left\{ \sum_{t=1}^{N}(x(t)-\mu)^2 - N(\bar{x}-\mu)^2 \right\} \\
       &= \frac{1}{N} \sum_{t=1}^{N}E[(x(t)-\mu)^2] - E(\bar{x}-\mu)^2 \\
       &= \frac{1}{N} \cdot N \cdot \sigma^2 - \frac{1}{N} \cdot \sigma^2 \\
       &= \left( \frac{N-1}{N} \right) \sigma^2
\end{align}
$$


## Notes
### [htbp] 设置浮动体的位置

| Symbol   | Word           | Description            |
|----------|----------------|------------------------|
| h        | here           | 尽量放在当前位置（当前位置的文本附近）    |
| t        | top            | 尽量放在当前页面的顶部            |
| b        | bottom         | 尽量放在当前页面的底部            |
| p        | page of floats | 放到专门的“浮动页”上（只有图表，没有正文） |

### 智能引用包
```
\usepackage{cleveref} % 包名称
% 定义前缀
\crefname{figure}{Fig.}{Figs.}
\Crefname{figure}{Figure}{Figures}
\crefname{table}{Table}{Tables}
\Crefname{table}{Table}{Tables}
\crefname{equation}{Eq.}{Eqs.}
\Crefname{equation}{Equation}{Equations}
```
如果使用“hyperref”包，那么“cleverref”需要在其之后加载。

cleveref must be loaded after hyperref.