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

$$
\begin{align}
E[V_b] &= \frac{1}{N}E\left[\sum_{t=1}^{N} (x(t)-\bar{x})^2\right] \\
       &= \frac{1}{N} E\left\{ \sum_{t=1}^{N}(x(t)-\mu)^2 - N(\bar{x}-\mu)^2 \right\} \\
       &= \frac{1}{N} \sum_{t=1}^{N}E[(x(t)-\mu)^2] - E(\bar{x}-\mu)^2 \\
       &= \frac{1}{N} \cdot N \cdot \sigma^2 - \frac{1}{N} \cdot \sigma^2 \\
       &= \left( \frac{N-1}{N} \right) \sigma^2
\end{align}
$$
