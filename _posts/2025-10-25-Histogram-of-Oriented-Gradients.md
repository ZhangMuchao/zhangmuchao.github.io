---
title: "Histogram of Oriented Grandients"
date: 2025-10-25 16:03:02
categories: [Computer Vision, Image Feature Extraction]
tags: [hog, detection]     # TAG names should always be lowercase
description: histogram of oriented gradients.
toc: true
math: true
---

## Algorithm

![An overview of HoG for feature extraction and object detection.](/assets/images/20251025001_HOG.png)

### Pre-processing
Gamma/Color normalization or other necessary processing.

### Gradient computation
The simplest 1-D [Prewitt operator](https://en.wikipedia.org/wiki/Prewitt_operator) works best. 
Mathematically, the operator uses $1 \times 3$ and $3 \times 1$ kernels which are convolved with the original image to calculate approximations of the gradient, one for horizontal changes, and one for vertical. 

Taking the source image $A$ as an example, $G_x$ and $G_y$ contain the horizontal and vertical gradient approximations, expressed as,

$$ G_x = [-1, 0, 1] * A$$
$$ G_y = [1, 0, -1]^T * A$$

where * is the convolution operation. The $x$-coordiante is defined as increasing in the "right" direction, and $y$-coordiante is defined as increasing in the "up" direction. At each point of the image, the resulting gradient can be combined to get the magnitude and direction,

$$ G = \sqrt{G_x^2 + G_y^2} $$

$$\Theta = artan2 \frac{G_y}{G_x} $$

where the "artan2" function gives a full $0^\circ$ to  $360^\circ$. HoG typically uses unsigned gradients, which means the edge and the edge rotated by $180^\circ$ are considered the same. Therefore, the angle value is normalized to $0^\circ$ to  $180^\circ$.

**Orientation**: The direction of the edge or texture

**Magnitude**: The strength or intensity of the edge

### Histogram of gradients
The third step is creating the cell histogram. Assuming that the image $A$ has $64 \times 128$ pixels. 

**Divide into cells** The image is segmented into cells with the size of $8 \times 8$ pixels. Therefore, image $A$ has 128 cells.

**Build the histogram** Each cell has $8 \times 8$ pixels, each pixel has the gradient magnitude and direction. Here, for example, 9 bins are considered for the histogram. The center of theses bins are $0^\circ$, $20^\circ$, $40^\circ$, $60^\circ$, ..., $160^\circ$. The histogram for one cell is thus a **9 elements vector**. For every pixel within this cell:
    
1. Take its gradient orientation $\Theta$ and magnitude $G$.
2. Determine the $\Theta$ falls between which two bins (确定相邻的两个区间).
3. **Weighted Voting (Bilinear Interpolation)**: The pixel's gradient magnitude $G$ is split and voted into these two nearest bins, proportional to how close it is to each bin center (像素的梯度幅值按照距离比例分配给这两个相邻的区间).
    * For example, a pixel has a gradient orientation of $85^\circ$, it lies between $80^\circ$ and $100^\circ$.
    * The distance to the $80^\circ$ is $5^\circ$, and the distance to the $100^\circ$ is $15^\circ$.
    * Hence, the magnitude $G$ is $\frac{20^\circ-5^\circ}{20^\circ} = \frac{15}{20}$ for the $80^\circ$ bin, and $\frac{5}{20}$ for the $100^\circ$ bin.

### Block normalization

**Group cells into blocks** adjacent cells are grouped into a larger region called a **block** (e.g., $2\times2$ grid of cells). The blocks can be overlapped. This means each cell can be a member of multiple blocks, and the final descriptor will repeatedly contain information from that cell. This redundancy improves performance. (相邻的单元cell组合为更大的块区域)

**Concatenate 串联** the cells within a specific block is concatenated into a longer vector (e.g., $2\times2$ cells $\times 9$ bins generates a **36 elements vector** )

**Normalize** use the $ l_2 $ norm strategy: $v = \frac{v}{||v||_2^2 + \xi}$, where $ \xi $ is a small constant to prevent division by zero.

### HoG feature vector
the normalized vectors from all blocks across the entire image are concatenated into a single, long, one-dimensional vector. This final vector is the HoG feature descriptor. (e.g., image $A$ has $64\times128$ pixels, it can be segemented into $8\times16 = 128$ cells (Assuming the cell size is $8\times8$) and therefore $7\times15 = 105$ blocks (assuming the moving step is 1 cell), each block has a **36 elements vector**, forming the HoG vector with $7\times15\times36$ elements.)

The HoG vector can be used for following classification and detection tasks.

## References
1. [Histograms of oriented gradients for human detection](https://ieeexplore.ieee.org/document/1467360).

2. [HOG方向梯度直方图算法](https://zhuanlan.zhihu.com/p/445740963).
