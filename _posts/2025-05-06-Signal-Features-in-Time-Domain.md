---
title: Signal features in time domain
date: 2025-05-06 17:23:52
categories: [Signal Processing, Time Domain]
tags: [matlab, feature extraction]     # TAG names should always be lowercase
description: 本文介绍了离散时间信号的基本统计特征提取方法，包括最大值、均值、方差、RMS、偏度、峰度等参数的定义及数学表达，适用于信号处理或特征提取分析。
toc: true
math: true
---

Example discrete-time signal $ x(t) $ has $ N(t=1,2,...,N) $ points. [uniform sampling interval].

## Basic features
maximum, local maximum, minimum, local minimum, peak to peak (Maximum-to-minimum difference)

### Mean
#### Mean (or average) [First moment]
幅值维度上的一阶矩，信号幅值的均值。

$$
\bar{x} = \frac{1}{N}\sum_{t=1}^{N} x(t) = E[x(t)]
$$

#### Weighted mean
$$
\bar{x}_w = \frac{\sum_{t=1}^{N}w(t) x(t)}{\sum_{i=1}^{N}w(t)}
$$

#### 绝对均值
$$
\bar{x}_{a}=\frac{1}{N}\sum_{t=1}^{N} |x(t)|
$$

### Mean square (Energy, the second raw moment)
$$
\Psi=\frac{1}{N} \sum_{t=1}^{N}x^2(t) = E[x^2(t)]
$$

常用于信号能量或功率计算

### Root mean square (RMS)
$$
RMS = \sqrt{\Psi} = \sqrt{\frac{1}{N} \sum_{t=1}^{N}x^2(t)}
$$

方根幅值

$$
x_{sra} = \left(\frac{1}{N}\sum_{t=1}^{N}\sqrt{|x(t)|}\right)^2
$$

Ref: **高爽. 齿轮故障特征参数提取及最佳特征参数选择研究[D].沈阳航空航天大学,2017.**

### Variance
#### Variance (biased) [The second central moment]
信号的方差，衡量信号在幅值方向上的波动程度。

$$
V_b = \frac{1}{N}\sum_{t=1}^{N} [x(t)-\bar{x}]^2 =E[(x(t)-\bar{x})^2]
$$

#### Variance (unbiased) (matlab)
$$
V_u = \frac{1}{N-1}\sum_{t=1}^{N} [x(t)-\bar{x}]^2  
$$

#### biased and unbiased estimation
##### For biased estimation

$$
\begin{align}
E[V_b] &= E\left[\frac{1}{N}\sum_{t=1}^{N} (x(t)-\bar{x})^2\right] \\
&= \frac{1}{N}E\left[\sum_{t=1}^{N} (x(t)-\bar{x})^2\right] \\
&= \frac{1}{N} E \left\{ \sum_{t=1}^{N}(x(t)-\mu)^2 - N(\bar{x}-\mu)^2 \right\} \\
&= \frac{1}{N} E \sum_{t=1}^{N}(x(t)-\mu)^2 - E(\bar{x}-\mu)^2 \\
&= \frac{1}{N}  \sum_{t=1}^{N}E[(x(t)-\mu)^2] - E(\bar{x}-\mu)^2
\end{align}
$$

+ 样本方差 $\sigma^2 = E[(x(t)-\mu)^2]$

+ 且, $E[(\bar{x}-\mu)^2] = E\left[\left(\frac{1}{N}\sum_{t=1}^{N} x(t) - \mu\right)^2\right]$

$$ = \frac{1}{N^2}E\left[\sum_{t=1}^{N}(x(t)-\mu)^2\right] = \frac{1}{N^2} \sum_{t=1}^{N} E(x(t)-\mu)^2 = \frac{1}{N}\sigma^2 $$

$$
原式=\frac{1}{N}\cdot N\sigma^2 - \frac{1}{N}\cdot\sigma^2 = \left(\frac{N-1}{N}\right)\sigma^2
$$

##### For unbiased estimation
$$
\begin{align}
E[V_u] &= \frac{1}{N-1}E\left[\sum_{t=1}^{N}(x(t)-\bar{x})^2\right] \\
&= \frac{1}{N-1} E \left\{ \sum_{t=1}^{N}(x(t)-\mu)^2 - N(\bar{x}-\mu)^2 \right\} \\
&=\frac{1}{N-1} \cdot N\cdot \sigma^2 - \frac{N}{N-1} \cdot \frac{1}{N} \sigma^2 \\
&= \sigma^2
\end{align}
$$

##### 附证明：
总体偏差平方和 = 样本偏差平方和 - 样本均值偏差的放大项

Total deviation sum of squares = Sample deviation sum of squares - amplified squared deviation of sample mean

$$
\sum_{t=1}^{N}(x(t)-\mu)^2 = \sum_{t=1}^{N}(x(t)-\bar{x})^2 + N(\bar{x}-\mu)^2
$$

where $x(t)$ is the sampled signal, $\mu$ is the true distribution mean, $\bar{x}$ is the mean of sampled signal.

left-hand side:
$$
\sum_{t=1}^{N}(x(t)-\mu)^2  
$$

+ decompose $x(t)-\mu$ as:
$$
x(t)-\mu = (x(t)-\bar{x}) + (\bar{x}-\mu)
$$

+ then
$$
(x(t)-\mu)^2 = (x(t)-\bar{x})^2 + (\bar{x}-\mu)^2 + 2(x(t)-\bar{x})(\bar{x}-\mu)
$$

+ sum them
$$
\sum_{t=1}^{N}(x(t)-\mu)^2 = \sum_{t=1}^{N} (x(t)-\bar{x})^2 + \sum_{t=1}^{N}(\bar{x}-\mu)^2 + 2(\bar{x}-\mu)\sum_{t=1}^{N}(x(t)-\bar{x})
$$

the term
$$
\sum_{t=1}^{N}(x(t)-\bar{x}) = 0
$$
because the deviation from the sample mean always sum to 0.

the term
$$
\sum_{t=1}^{N}(\bar{x}-\mu)^2 = N \cdot (\bar{x}-\mu)^2
$$
because it is the same constant added $N$ times.

Put it all together:
$$
\sum_{t=1}^{N}(x(t)-\mu)^2 = \sum_{t=1}^{N}(x(t)-\bar{x})^2 + N(\bar{x}-\mu)^2
$$

#### Weighted variance
$$
V_w = \frac{\sum_{t=1}^{N}w(t) [x(t)- \bar{x}_w]^2}{\sum_{i=1}^{N}w(t)}
$$

### Standard deviation
The standard deviation is the square root of variance.

Biased estimation:

$$
S_b=\sqrt{V_b}=\sqrt{\frac{1}{N}\sum_{t=1}^{N} [x(t)-\bar{x}]^2}
$$

Unbiased estimation (matlab):

$$
\sigma = S_u = \sqrt{V_u} = \sqrt{\frac{1}{N-1}\sum_{t=1}^{N} [x(t)-\bar{x}]^2 }
$$

## Dimensionless quantity
### Kurtosis (峰度、峭度)
The kurtosis is the **fourth standardized moment**, defined as,

$$
k = E\left[\left(\frac{x-\mu}{\sigma}\right)^4\right] = \frac{E[(x-\mu)^4]}{\sigma^4} = \frac{\mu_4}{\sigma^4}
$$

where $\mu_4$ is the fourth central moment and $\sigma$ is the standard deviation.

Kurtosis is a measure of how outlier-prone a distribution is. The kurtosis of the normal distribution is 3. Distributions that are more outlier-prone than the normal distribution have kurtosis greater than 3. Distributions that are less outlier-prone have kurtosis less than 3.

### Skewness (偏度)
The skewness is the **third standardized moment**, defined as,

$$
s = E\left[\left(\frac{x-\mu}{\sigma}\right)^3\right] = \frac{\mu_3}{\sigma^3}
$$

where $\mu_3$ is the third central moment and $\sigma$ is the standard deviation.

Skewness is a measurement of the asymmetry of the data around the mean of the sample. If skewness is negative, the data spreads out more to the left of the mean than to the right. If skewness is positive, the data spreads out more to the right. The skewness of the normal distribution (or any perfectly symmetric distribution) is zero.

### Peak factor/Crest factor 峰值因子
Peak factor is the ratio of the peak value and the root mean square value of an alternating quantity, it can be mathematically expressed as,

$$
pk = \frac{x_{p-p}}{x_{rms}} \quad \text{or} \quad pk = \frac{\max(|x|)}{x_{rms}}
$$

**该值代表的是峰值在波形中的极端程度。**

### Impulse factor 脉冲因子
This value is calculated from the ratio of the peak value of the input signal to the mean value of the absolute value of the input signal (绝对均值).

$$
Impulse\ factor = \frac{\max(|x|)}{\frac{1}{N}\sum{|x|}} \quad \text{or} \quad Impulse\ factor = \frac{x_{p-p}}{\frac{1}{N}\sum{|x|}}
$$

脉冲因子和峰值因子的区别在分母上，由于同一组数据的绝对均值小于有效值rms，所以脉冲因子大于峰值因子。

### Margin factor 裕度因子
It is the ratio between peak value and the signal's mean of square root of absolute signal value.

$$
Margin\ factor = \frac{x_{p-p}}{x_{sra}} = \frac{x_{p-p}}{\left(\frac{1}{N}\sum_{t=1}^{N}\sqrt{|x(t)|}\right)^2}
$$

### 波形因子
有效值和整流平均值的比值，在电子领域其可以理解为直流电流相对于等功率的交流电流的比值，该值大于等于1。

$$
波形因子 = \frac{x_{rms}}{\frac{1}{N}\sum{|x|}} = \frac{Impulse\ factor}{peak\ factor}
$$

### Zero crossing
It is a feature that counts the number of times the waveform crosses zero. A small threshold $\varepsilon$ can be included to avoid signal crossing due to low-level noise. Defined by,

$$
\{x(t) > 0 \ \& \ x(t+1) < 0\} \quad \text{or} \quad \{x(t) < 0 \ \& \ x(t+1) > 0\}
$$

$$
|x(t)-x(t+1)| \geq \varepsilon
$$

## References
[1] [Kurtosis](https://en.wikipedia.org/wiki/Kurtosis)

[2] [Mathworks - Kurtosis](https://www.mathworks.com/help/stats/kurtosis.html)

[3] [Peak Factor Definition](https://electricalampere.com/peak-factor-definition-formula/)

[4] [Margin Factor 裕度因子](https://ieeexplore.ieee.org/document/9393014)

[5] **高爽. 齿轮故障特征参数提取及最佳特征参数选择研究[D].沈阳航空航天大学,2017.**

[6] [信号时域分析方法的理解[峰值因子、脉冲因子、裕度因子、峭度因子、波形因子和偏度等]](https://zhuanlan.zhihu.com/p/35362151)

[7] [时域特征值提取的MATLAB代码实现[均方根、峰值因子、脉冲因子、裕度因子、峭度因子、波形因子和偏度等]](https://zhuanlan.zhihu.com/p/36162561)
