---
title: "Steerable pyramids decomposition (based AI studio)"
date: 2025-10-25 16:03:02
categories: [Computer Vision, Image Feature Extraction]
tags: [gradient, filter]     # TAG names should always be lowercase
description: The steerable filter can provide the image gradient in any orientation/direction.
toc: true
math: true
---

## Image pyramids

The image pyraminds is an efficient multi-scale representation of an image. The core idea is to decompose the original image, which is the base of the pyramid, at multiple resolution by performing a serious of down-sampling operations. This will generate a sequence of iamges with progressively lower resolution, forming a "pyramid" shape from btm to top.

<!--
图像金字塔分解 是一种在多个分辨率下表示图像的有效结构。其核心思想是将原始图像（金字塔底部）通过一系列的下采样（缩小）操作，生成一系列分辨率逐渐降低的图像，形成一个从底到顶、分辨率由高到低的“金字塔”状结构。

通常，金字塔分解包含两种主要类型：

高斯金字塔：用于向下采样（缩小图像）。它通过高斯模糊和隔点采样来构建，每一层的图像都是前一层图像的近似，但尺寸更小、细节更少。

拉普拉斯金字塔：用于从金字塔的上层图像重建下层图像，是高斯金字塔的补充。它存储的是每一层与通过上一层重建的图像之间的差异（细节信息）。通过拉普拉斯金字塔，我们可以无损地从最高层（最模糊、最小）的图像恢复出最底层（原始）的图像。

金字塔分解的主要应用包括图像融合、图像

压缩、纹理分析、目标检测（特别是在不同尺度下）等。

-->

### Gaussian pyramid

This decomposition is used for "down sampling", which is built by **Gaussian blurring and downsampling** at each level. Each level is an approximation of the previous level but with smaller dimensions and fewer details. 

Algorithm steps:

1. The bottom layer: $ G_0 = original\ image $
2. Apply Gaussian blur: $ G_i^{\prime} = G_i \bigotimes \omega$, where $ \omega $ is the Gaussian kernel, preventing aliasing during downsampling.
3. Downsample: (one possible operation) $ G_{i+1}(x,y) = G_i^{\prime}(2x,2y) $, obtain an image is $1/4$ of the original image.
4. Repeat until the image becomes small enough, for example, reaching a minimum size of $ 4\times 4 $ pixels.

### Laplacian pyramid

This is built from Gaussian pyramid, each Laplacian level is the **difference between a Gaussian level and an upsampled version of the next level**. 

The image pyramid can be applied for image blending (图像融合), image compression, texture analysis, and object detection at various scales
