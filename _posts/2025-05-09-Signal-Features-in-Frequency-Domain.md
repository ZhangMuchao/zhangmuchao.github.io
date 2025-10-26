---
title: Signal features in frequency domain
date: 2023-05-09 15:40:55
categories: [Signal Processing, Frequency Domain]
tags: [matlab, feature extraction, fft]     # TAG names should always be lowercase
description: 
toc: true
math: true
---
信号频谱分析方法通常分为经典频谱分析和现代频谱分析两大类。

### 3.1 信号的频谱和FFT算法及应用
#### 3.1.1 傅里叶级数与离散频谱
任何周期性信号$ x(t) $根据傅里叶级数可展开为若干简谐信号的叠加：
$$
x(t)= a_0 + \sum_{n=1}^{\infty} (a_n cos n \omega_0 t + b_n sin n \omega_0 t)
=A_0 + \sum_{n=1}^{\infty} A_n sin (n \omega_0 t+ \phi _n)
$$

其中，$ A_0 $ 是静态分量；$ \omega_0 $ 是基频；$ n\omega_0 $ 是第n次谐波；周期信号可分为一个或几个、乃至无穷多个谐波的叠加。如果以频率为横坐标，幅值和相位为纵坐标可以得到信号的幅频谱和相频谱。周期信号的频谱具有离散性、谐波性和收敛性三个特点。

#### 3.1.2 傅里叶变换与连续频谱
当周期信号的周期趋于无穷大时，则该信号可看成非周期信号，信号的谱线间隔 $ \Delta \omega = \frac{2\pi}{T} $ 趋于无穷小，非周期信号的频谱是连续的。

Fourier Transform
$$
X(\omega) = \int_{-\infty}^{+\infty} x(t) e^{-j \omega t} dt
$$

Inverse Fourier Transform
$$
x(t) = \frac{1}{2 \pi} \int_{-\infty}^{+\infty} X(\omega)e^{j \omega t} d\omega
$$

$ X(\omega) $ 为 $ x(t) $ 的傅里叶变换，$ x(t) $ 为 $ X(\omega) $ 傅里叶逆变换，两者互称为傅里叶变换对。将 $ \omega = 2\pi f $ 带入傅里叶变换对，可得：

$$
X(f)=\int_{-\infty}^{+\infty} x(t)e^{-j2\pi ft} dt  
$$

$$
x(t)=\int_{-\infty}^{+\infty} X(f)e^{j2\pi ft} df 
$$

在整个时间轴上的非周期信号 $ x(t) $ 是由频率 $ \omega $ 的谐波 $ X(\omega) e^{j\omega t}d \omega $ 沿频率从负无穷连续到正无穷，通过积分叠加得到的。由于对不同的频率 $ \omega $ ，$ d\omega $ 是一样的，所以只需 $ X(\omega) $ 就能真实反映不同频率谐波的振幅和相位的变化。因此我们称 $ X(\omega) $ 为 $ x(t) $ 的连续频谱。一般 $ X(\omega) $ 为复函数，可写成：

$$
X(\omega)=|X(\omega)|e^{j \phi (\omega)} 
$$
$ |X(\omega)| $ 为信号的连续幅值谱，$ \phi (\omega) $ 为信号的连续相位谱。

#### 3.1.3 特点

##### Statement:
> The magnitude spectrum of periodic signals and aperiodic signals have different units (or dimensions).

When performing Fourier analysis, the **magnitude spectrum** — which tells us how strong each frequency component is — has **different physical units** depending on whether the signal is **periodic** or **aperiodic (non-periodic)**.

###### Periodic Signals

- Represented using **Fourier Series**
- The frequency spectrum is **discrete**
- Each frequency component has a **finite amplitude**
- The magnitude spectrum shares the **same units** as the original signal

If a voltage signal has units of **volts (V)**, then its Fourier coefficients (magnitude spectrum) will also be in **volts (V)**.

Why?
- Each component is just a scalar multiplier for a sinusoid at a specific frequency.
- No frequency “density” involved.

###### Aperiodic Signals

- Represented using the **Fourier Transform**
- The frequency spectrum is **continuous**
- The magnitude spectrum is actually a **density function** (per frequency)

If the time-domain signal is in **volts (V)**,  
then the spectrum $ X(\omega) $ will have units like:
- **V·s** (volt-seconds) in angular frequency domain  
- or **V/Hz** (volt per hertz) in frequency domain

Why?
- The spectrum tells you how much “voltage” per unit of frequency exists.
- Since the transform is an **integral over frequency**, units must reflect that.

| Signal Type     | Spectrum Type | Spectrum Unit              |
|------------------|----------------|-----------------------------|
| Periodic Signal  | Discrete       | Same as signal (e.g., V)    |
| Aperiodic Signal | Continuous     | Signal unit / Frequency unit (e.g., V/Hz or V·s) |


##### 傅里叶变换主要有以下性质：

线性叠加性、时移性、频移性、时间伸缩性、时间微分、时间积分性、卷积定理

#### 3.1.4 离散傅里叶变换(PFT)
傅里叶变换及其逆变换均不能宜接用于计算机计算。对于离散的数字信号进行傅里叶变换，需借助离散傅里叶变换。

离散傅里叶变换：

![](/assets/images/20250704009_FFT1.png)

离散傅里叶逆变换：

![](/assets/images/20250704009_FFT2.png)

上式中，$ x(k\Delta t) $ 是波形信号的采样值；$ N $ 是序列点数；$ \Delta t $ 是采样间隔；$ n $ 是频域离散值的序号；$ k $ 是时域离散的序号。离散傅里叶变换和离散傅里叶逆变换构成了离散傅里叶变换对。它将 $ N $ 个时间域的采样序列和 $ N $ 个频率域采样序列联系起来。基于这种对应关系，考虑到采样间隔 $ \Delta t $ 的具体数值不影响离散傅里叶变换的实质。所以，通常略去采样间隔 $ \Delta t $，傅里叶变换对可写为：

![](/assets/images/20250704009_FFT3.png)

![](/assets/images/20250704009_FFT4.png)

式中 $ W_N=e^{-j2 \pi /N} $ 。

#### 3.1.5 快速傅里叶变换
虽有了DFT理论及计算方法，但对长序列的DFT，因计算工作量大、计算时间长限制了实际应用。这就迫使人们想办法提高DFT的计算速度。

FFT的基本思想是把长度为2的正整数次幂的数据序列 $ \{ x_k\} $ 分隔成若干较短的序列作DFT计算，用以替代原始序列的DFT计算。然后在再把他们合并起来，得到整个序列的DFT。

FFT先对原数据序列按奇、偶逐步进行抽取。

原始序列 $ \{ x_0, x_1, x_2 x_3, x_4, x_5, x_6, x_7 \} $ 1个长度为8的序列

第一次抽取 $ \{ x_0, x_1, x_2, x_3  \}, \{ x_4, x_5, x_6, x_7\} $ 2个长度为4的序列

第二次抽取 $ \{ x_0, x_1 \}, \{  x_2, x_3  \}, \{ x_4, x_5 \}, \{x_6   x_7\} $ 4个长度为2的序列

第三次抽取 $ \{ x_0 \}, \{  x_1 \}, \{  x_2\}, \{ x_3 \}, \{  x_4\}, \{ x_5 \}, \{x_6 \}, \{x_7\} $ 8个长度为1的序列

$ N=8 $ 时的计算流程图，逆变换的计算同理。计算量由 $ N^2 $ 降为 $ N\log_2 N $ 。

![](/assets/images/20250704009_FFT5.png)

#### 3.1.6 FFT的校正算法
由于计算机只能对**有限长度**的信号样本进行计算，因此，信号的快速傅里叶变换也只能对有限长度序列进行。这就相当于给原信号加了一个**矩形窗**，不可避免的存在由于时域截断而引起的**能量泄漏**，使得**谱峰幅值变小，精度降低**。

改进方法：

+ 增加采样长度：采样长度的增加受硬件限制；
+ 降低采样频率：采样频率又受到实际信号最高频率的约束；
+ 整周期采样：整周期采样技术的实现需要复杂的硬件，且不能有效测定信号中的分数倍频分量；
+ ZOOM-FFT细化频谱技术：该技术虽然能够提高频率分辨率，但低通滤波器的过渡带却使分析频带两端的幅值存在一定的误差；
+ 比值校正算法：

通过主瓣中心两侧的两根谱线的幅值和频率的大小，利用窗函数的频谱图形，去求主瓣中心点A点的坐标。

![](/assets/images/20250704009_FFT6.png)

设为主瓣中心与左谱线的距离，由窗函数的频谱函数构成如下函数：

$$
F(x)=\frac{W(\omega_l)}{W(\omega_r)}
=\frac{W(\omega_0-x)}{W(\omega_0+\Delta\omega-x)}
=\frac{y_l}{y_r},x\in[a,\Delta\omega] 
$$

校正频率为 $ \omega_0=k\Delta\omega+\Delta K $ ，校正幅值 $ A=\frac{y_k}{W(\Delta K)} $ ，校正相位
$ \phi_0=\phi_k - \Delta K\pi / \Delta \omega $ 。

+ 峰值搜寻算法

优化函数 $ min(U(x)) $，约束条件 $ x \in [0,\Delta \omega] $

其中：$ U(x)=[\frac{W(\omega_0-x)}{W(\omega_0+\Delta\omega-x)} -\frac{y_l}{y_r}]^2 $

通过一维优化方法求得极小值的 $ x $，这样无论所加窗函数的形式多么复杂，都可以进行频率、幅值和相位的校正。

#### 3.1.7 确定性信号的傅里叶谱分析
对确定性信号进行傅里叶谱分析，实质是对信号进行时域到频域的转换。确定性信号$ x_n $的傅里叶谱$ X_m $是个复数，因此它包含实频、虚频或幅频、相频等信息。

表示形式

+ 实频特性及虚频特性：$ X_m=X_{mR}+X_{mI} $
+ 幅频特性及相频特性：$ A_m=\sqrt{X_{mR} ^ 2+X_{mI} ^ 2} $，$ \phi_m=arctan(\frac{X_{mI}}{X_{mR}}) $
+ 幅频、相频率特性或奈魁斯特图：将 $ X_m $ 视为极坐标中的一矢量，用此矢量端点随频率而变化的轨迹来表示 $ X_m $ 的幅频、相频率特性。

傅里叶谱的幅值信息，有三种不同的表示方法：幅值谱、均分谱、对数谱。

#### 3.1.8 功率谱密度函数
功率谱密度函数反应了信号的功率在频域随频率$ \omega $的分布。功率谱密度函数也分为自功率谱密度函数和互功率谱密度函数。

自功率谱密度函数是信号$ x(t) $的自相关函数$ R_x(\tau ) $的傅里叶变换，其定义为

$$
S_x(\omega)=\int_{-\infty}^{\infty} R_x(\tau)e^{-j\omega \tau}d\tau 
$$

自功率谱密度函数<font style="color:rgb(77, 81, 86);">反映相关函数在时域内表达随机信号自身与其他信号在不同时刻的内在联系.</font>

两组随机信号 $ x(t) $ 和 $ y(t) $ 的互谱密度函数定义为互相关函数 $ R_{xy}(\tau ) $ 的傅里叶变换

$$
S_{xy}(\omega)=\int_{-\infty}^{\infty} R_{xy}(\tau)e^{-j\omega \tau}d\tau 
$$

#### 3.1.9 频谱分析的工程应用
自功率谱密度函数的应用包括：

+ 动态信号的频率组成和频率结构分析；
+ 故障的判断和分析；
+ 材料寿命试验；
+ 医学上可测量的脑电波、心电图等进行自谱分析，用以研究病症和病理。
+ 在军事上的应用，例如侦察并判明潜水艇的型号。
+ 自谱分析还可识别和判断周期信号和随机信号。

互功率谱密度函数的应用包括：

+ 通过互功率谱密度函数、自功率 谱密度函数之间的关系，可以测量出系统的频率特性（或传递函数）。
+ 滞后时间测量。
+  测量滤波器的特性，预测最佳线性。

### 3.2 相干分析及应用
#### 3.2.1 相干函数的概念
相干函数分析建立在平稳机械信号的自功率谱密度函数 $ S_x(\omega) $，$ S_y(\omega) $ 和互功率谱密度函数 $ S_{xy}(\omega) $ 之上。相干函数的定义如下：

$$
\gamma_{xy}^2 (\omega) = \frac{|S_{xy}(\omega)|^2}{S_{x}(\omega)S_{y}(\omega)} 
$$
$$ 
0\le\gamma_{xy}^2 (\omega) \le 1 
$$

相干函数义称凝聚函数。相干函数是频率的函数。它在频域内描述信号 $ x(t) $ 和 $ y(t) $ 的相关性。$ \gamma_{xy}^2 (\omega) $ 具有明确的物理意义，反映了信号 $ y(t) $ 中频率 $ \omega $ 的分量在多大程度上来源于信号 $ x(t) $ 。当 $ \gamma_{xy}^2 (\omega)=1 $ 说明信号 $ y(t) $ 中频率 $ \omega $ 的分量完全来源于信号 $ x(t) $ ，称为完全相干。

一般情况下相干函数 $ \gamma_{xy}^2 (\omega) $ 取值在0~1之间：

1. 测量中存在外部噪声；
2. 谱估计中存在分辨率偏差；
3. 系统是非线性的；
4. 除了输入信号 $ x(t) $ 之外还有其它输入;

对线性系统可理解为在各频率处信号 $ y(t) $ 有一部分来源于信号 $ x(t) $ ，而其余则来源于其它的信号源或外界噪声的干扰。另外需要注意的是，如果输入的平稳随机信号其均值不等于零，在求 $ \gamma_{xy}^2 (\omega) $ 时还需要进行零均值化处理。

#### 3.2.2 相干函数的应用
1. **判断系统输出与某特定输人的相关程度。** 利用相干函数可发现系统是否还有其它输入干扰及系统的线性程度。真正的线性系统，在无外界干扰的情况下， 其输出对某特定输入的相干函数应等于1。
2. **谱估计和系统动态特性的测量精度估计**。 在计算传递函数的幅频特性及相频特性时，辅以相干函数分析，可以分析出机械系统和基础振动的传递特性，为结构动力学分析提供依据。

### 3.4 倒频谱(Cepstrum)分析及应用
#### 3.4.1 倒频谱的数学描述
设时域信号 $ x(t) $ 的傅里叶变换 为 $ X(f) $ ，功率谱密度函数为 $ S_x(f) $ 。所谓倒频谱，就是对功率谱 $ S_x(f) $ 的对数值进行傅里叶逆变换。 倒频谱函数 $ C_p(q) $ 的数学表达式为:

$$
C_p(q)=F^{-1}\{\log S_x(f)\} 
$$

倒频谱中自变量 $ q $ 称为倒频率，它具有与自相关函数 $ R_x(\tau) $ 中的自变量 $ \tau $ 相同的时间量纲。 $ q $ 值大者称为高倒频率，表示谱图上的低速波动。  $ q $ 值小者称为低倒频率，表示谱图上的快速波动。

倒频谱是频域函数的傅里叶再变换，与相关函数不同只差对数加权。 对功率谱函数取对数的目的，是使变换以后的信号能量格外集中，同时还可解卷积成分， 易于对原信号的识别。

#### 3.4.2 倒频谱与解卷积
工程上实测的波动、噪声信号往往不是振源信号本身，而且振源或声源信号 $ x(t) $ 经过传递系统 $ h(t) $ 到测点输出信号 $ y(t) $ 。 对于线性系统 $ x(t),y(t),h(t) $ 三者 的关系可用卷积公式表示:

$$
y(t)=x(t)*h(t)=\int_0^{\infty} x(\tau)h(t-\tau)d\tau 
$$

在时域上信号经过卷积后一般是一个比较复杂的波形，难以区分源信号与系统的响应。继续作傅里叶变换，在频域上进行分析：$ S_y(f)=S_x(f)S_h(f) $

两边取对数 $ \log S_y(f)=\log S_x(f)+\log S_h(f) $ 再进一步作傅里叶逆变换，可得倒频谱:

$$
F^{-1}\{\log S_y(f)\}=F^{-1}\{\log S_x(f)\}+F^{-1}\{\log S_h(f)\} 
$$

或

$$ 
C_y(q)=C_x(q)+C_h(q) 
$$

![](/assets/images/20250704009_FFT7.png)

上式在倒频域上由两部分组成，即低倒频率 $ q_1 $ 和高倒频率 $ q_2 $ 。 前者表示源信号 $ x(t) $ 的谱特征，而后者表示系统特性 $ h(t) $ 的谱特征，它们各自在倒频谱图上占有不同的倒频率位置。 因而，倒频谱可以提供清晰的分析结果。

#### 3.4.3 倒频谱的应用
倒频谱分析具有广泛的工程应用。

+ 机械故障诊断：机械中齿轮、滚动轴承等出现故障时，信号的频谱上会出现难以识别的多簇调制边频带。采用倒频谱分析可分解和识别故障频率、故障的 原因和部位。
+ 语音和回声分析及解卷积：振源或声源信号往往受到传递系统或途径影响，采用倒频谱分析技术可以分离和提取源信号与传递系统影响，有利于对问题本质的研究。


### Reference

[1] 测试技术与信号处理（范云霄).

[2] 基于互相关的信号检测研究与实现[J].
