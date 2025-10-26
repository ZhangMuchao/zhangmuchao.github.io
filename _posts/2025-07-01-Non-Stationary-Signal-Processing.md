---
title: Non-Stationary signal processing
date: 2025-07-01 17:23:52
categories: [Signal Processing, Time-Frequency Domain]
tags: [cwt, non-stationary signal, fft, sfft]     # TAG names should always be lowercase
description: 许多随机过程从本质上说是非平稳的，利用傅里叶变换不能有效的进行时频分析。对千非平稳、非正弦的机电设备动态信号的分析，必须寻找既能够反映时域特征又能够反映频域特征的新方法，才能提供信号特征全貌，正确有效地进行时、频分析。
toc: true
math: true
---

### 5.1 短时傅里叶变换（加窗傅里叶变换）
#### 基本思想
将信号划分成许多小的时间间隔，用傅里叶变换分析每一个时间间隔，以便确定该时间间隔存在的频率。我们定义一个中心宽度为width的窗函数窗函数除了中心宽度为width的部分为1外，其它部分都是0，这就相当于提取了原信号在 $ t=t_s $ 处，宽度为width的部分.

![](/assets/images/20250704011_sfft1.png)

![](/assets/images/20250704011_sfft2.png)

![](/assets/images/20250704011_sfft3.png)

<font style="color:black;">选定一个基本的窗函数之后，将窗函数沿时间轴平移得到一组窗函数。平移后的窗函数分别和原信号相乘，其结果就等效于提取了原信号的不同时间段内的信息而屏蔽了窗外的信号。每个段内的信号视为平稳的，对其进行傅里叶变换，从而得到信号的频谱，或者计算幅频特性的平方作为该段信号的功率谱。</font>

![](/assets/images/20250704011_sfft4.png)

$ X(\omega, t_s) $ 是一个三维函数，有两个自变量 $ \omega,t_s $ 。加窗傅里叶变换提取出来的信息：在原信号 $ t=t_s $ 处，宽度为width的部分所包含的频率信息.

![](/assets/images/20250704011_sfft5.png)

<font style="color:black;">这里分窗操作使用的函数称为“方窗函数”，这是一种窗函数。还有一些其他的窗函数，比如，汉宁窗、海明窗、高斯窗等。</font>

#### 短时傅里叶变换的缺点
<font style="color:#121212;">加窗傅里叶变换的</font><font style="color:black;">窗函数的窗长是固定的，即时域分辨率是固定的，根据海森堡测不准原理，其频域分辨率也是固定的。</font><font style="color:#121212;">也就是说，</font>**<font style="color:#121212;">不论高频低频，时间和频率分辨率都固定，不能随着频率的高低实现动态可调。</font>**

<font style="color:#121212;">测不准原理：</font>$ \Delta t \Delta f >C $,其中 $ \Delta t $ 为信号的时间不确定度，$ \Delta f $ 为<font style="color:black;">频率不确定度。</font><font style="color:#121212;">对于低频信号，为了更好地确定频率，我们希望，时域区间宽一些，即时间不确定度 $ ∆t $ 大一些，根据海森堡测不准原理，频率不确定度 $ ∆f $ 自然小一些；即</font>**<font style="color:#121212;">低频信号，我们希望：宽窗子，低的时域分辨率，高的频域分辨率。</font>**<font style="color:black;">对于高频信号，为了更好地在时域定位，我们希望，时域区间窄一些，即时间不确定度</font><font style="color:#121212;"> $ ∆t $ </font><font style="color:black;">小一些，根据海森堡测不准原理，频率不确定度</font><font style="color:#121212;"> $ ∆f $ </font><font style="color:black;">自然大一些；即高频信号，我们希望：</font>**<font style="color:black;">窄窗子，高的时域分辨率，低的频域分辨率。</font>**

![](/assets/images/20250704011_sfft6.png)

### 5.2 连续小波变换
<font style="color:black;">为了实现动态分辨率，引入基本小波（或称为母小波）</font><font style="color:#121212;">Ψ(t)</font>.<font style="color:#121212;">母小波函数并不是一个特定的函数，而是一种函数的集合，满足了一定条件的函数均可以作为母小波函数。</font>

<font style="color:#121212;">小波母函数Ψ(t)</font><font style="color:black;">需要满足的条件有：</font>

**<font style="color:#121212;">条件1：紧支撑性。</font>**<font style="color:black;">即仅在一小部分定义域里不为0，剩下部分均为0。具有紧支撑性的基函数，在原信号的时间轴上平移，就相当于对于原信号就行了加窗操作。</font>

$$
\exists a>0,\forall|t|>a,\Phi(t)=0
$$

<font style="color:black;">条件2，波动性。在所有定义域内积分值为0，这说明小波母函数是一个波。</font>

$$
\int_{-\infty} ^{\infty} \Phi(t)dt=0 
$$

<font style="color:black;">条件3，容许条件。</font>

<font style="color:black;">条件4，正交性。</font>

<font style="color:black;">母小波函数的变换公式：</font>

$$
\Phi^*(\tau, s)=\frac{1}{\sqrt s}\Phi(\frac t s -\tau) 
$$

平移：<font style="color:black;">是由上式中的</font> $\tau$ <font style="color:black;">控制，</font> $\tau$ <font style="color:black;">改变，相当于在时间轴上不断的平移；</font>

<font style="color:black;">二是缩放，由上式中的</font>s控制<font style="color:black;">，变换后的函数称为小波函数；</font>

![](/assets/images/20250704011_sfft8.png)

<font style="color:black;">中间的图，s较小，相当于挤压，右侧的图，s较大，相当于拉伸。中间的图，s较小，相当于挤压，频率提高了；右侧的图，s较大，相当于拉伸，频率降低了。缩放就相当于改变频率。s越大，频率f越低，s, $f$ 是倒数关系。中间的图，s较小，相当于挤压，频率提高了，窗长变小了；右侧的图，s较大，相当于拉伸，频率降低了，窗长变大了。</font><font style="color:#121212;">这就可以实现我们需要的</font>**<font style="color:#121212;">“低频，宽窗，差的时间分辨率，好的频域分辨率；高频，窄窗，好的时间分辨率，差的频域分辨率”。</font>**

<font style="color:black;">连续小波变换的计算主要有如下五个步骤： </font>

<font style="color:black;">第一步： 取一个小波， 将其与原始信号的开始一节进行比较。 </font>

<font style="color:black;">第二步： 计算并表示小波与所取一节信号的相似程度，计算结果取决于所选小波的形状。</font>

<font style="color:black;">第三步：向右移动小波，重复第一步和第二步，直至覆盖整个信号。</font>

<font style="color:black;">第四步：变换小波， 重复第一步至第三步。 </font>

<font style="color:black;">将上述连续小波变换（CWT）的过程写成公式：</font>

$$
CWT_x ^\phi(\tau , s)=\frac{1}{\sqrt s}
\int_{-\infty} ^{\infty}
x(t)\Phi(\frac t s -\tau)dt 
$$

#### 傅里叶变换、短时傅里叶变换、小波变换的对比
![](/assets/images/20250704011_sfft7.png)

**<font style="color:black;">傅里叶变换</font>**<font style="color:black;">的基函数是分布在</font>(-∞，+∞)<font style="color:black;">的sin和cos，不具有紧支撑性，只能筛选频率，使得FT完全丧失了时间信息，不具有时间分辨率。</font>

**<font style="color:black;">加窗傅里叶变换</font>**<font style="color:black;">的基函数，是用窗函数截断的（图中是被高斯窗截断的），具有了紧支撑性，时域平移等同于分窗，使得STFT既能筛选频率，也能筛选时间。但是STFT基函数是：先确定频率，再与窗函数相乘构成的。因此不同的频率，具有同样的时间和频率分辨率。另外，窗函数的长短也比较难以确定。</font>

**<font style="color:black;">连续小波变换</font>**<font style="color:black;">的基函数，是小波函数，具有紧支撑性，时域平移等同于分窗，使得CWT既能筛选频率，也能筛选时间。小波函数在改变频率的时候，是通过“缩放”实现的，这使得小波函数在改变频率的同时，改变了窗长。因此不同的频率，具有不同的时间和频率分辨率，实现了分辨率动态可调。</font>**<font style="color:black;">实现信号在不同频带、不同时刻的合理分离，也可以视为一个滤波器。</font>**

<font style="color:black;">像傅立叶变换一样，小波变换就是把一个信号分解为将母小波经过缩放和平移之后的一系列小波，因此小波是小波变换的基函数。小波变换可以理解为用经过缩放和平移的一系列小波函数代替傅立叶变换的正弦波和余弦波进行傅立叶变换的结果。</font>

### 5.3 离散小波变换
<font style="color:#121212;">我们知道，小波母函数本质上是一种带通滤波器。那么，假设可以通过小波母函数构造得到两个滤波器（至于怎么得到后续会介绍一下），包括</font>**<font style="color:#121212;">一个高通滤波器和一个低通滤波器</font>**<font style="color:#121212;">。</font>

<font style="color:#121212;">假设信号中的最高频率为</font><font style="color:#121212;">Fs</font><font style="color:#121212;"> 。那么，高通滤波器的作用就是得到（</font><font style="color:#121212;">Fs/2</font><font style="color:#121212;">，</font><font style="color:#121212;">Fs</font><font style="color:#121212;">）的部分，低通滤波器的作用就是得到（</font><font style="color:#121212;">0</font><font style="color:#121212;">，</font><font style="color:#121212;">Fs/2</font><font style="color:#121212;">）的部分。如下图所示：</font>

![](/assets/images/20250704011_cwt1.png)

<font style="color:#121212;">我们将这个过程称为一次</font>**<font style="color:#121212;">半子带滤波</font>**<font style="color:#121212;">。</font>

<font style="color:#121212;">我们定义一个N倍下采样过程：</font>**<font style="color:#121212;">将采样点N倍稀释</font>**<font style="color:#121212;">。如下，就是一个2倍下采样过程，将采样点稀释2倍，即：每2个点采样数据点，就去除一个点。N倍上采样过程：</font>**<font style="color:#121212;">将采样点数量增加N倍</font>**<font style="color:#121212;">。一般通过补0，或者插值的方法实现上采样。</font>**<font style="color:black;">我们将一次半子带滤波+一次2倍下采样称为一层小波分解。</font>**

![](/assets/images/20250704011_cwt2.png)

<font style="color:black;">离散小波变换的快速算法之一通过不断的半子带滤波和下采样，控制不同频率成分的频域分辨率，进而达到动态分辨率。将信号的小波分解的分量进行处理后，一般还要根据需要把信号恢复出来，也就是利用信号的小波分解的系数还原出原始信号，这一过程称为小波重构（Wavelet Reconstruction）或叫做小波合成（Wavelet Synthesis）。这一合成过程的数学运算叫做逆离散小波变换（Inverse Discrete Wavelet Transform， IDWT）</font>

![](/assets/images/20250704011_cwt3.png)

### 5.4 小波变换的特点
•<font style="color:black;">小波变换，既具有频率分析的性质，又能表示发生的时间。有利于分析确定时间发生的现象。（傅里叶变换只具有频率分析的性质）</font>

•<font style="color:black;">小波变换的多分辨度的变换，有利于各分辨度不同特征的提取（图象压缩，边缘抽取，噪声过滤等）</font>

•<font style="color:black;">小波变换比快速Fourier变换还要快一个数量级。</font>

### 5.5 小波变换的应用
<font style="color:black;">一个含噪声的一维信号模型可以表示成如下的形式。</font>

$$
𝑆(𝑡)=𝑓(𝑡)+𝜎\cdot𝑒(𝑡)
$$

<font style="color:black;">其中</font> $ 𝑓(𝑡) $ <font style="color:black;">表示无噪声的真实信号，</font> $ 𝑒(𝑡) $ <font style="color:black;">表示噪声，</font> $ S(t) $ <font style="color:black;">表示含有噪声的信号。</font>

<font style="color:black;">如果以一个最简单的噪声模型加以说明，认为噪声为高斯白噪声。在实际的应用工程中，有用信号通常表现为低频信号或者是一些平稳的信号，而噪声通常表现为高频信号。实际的含噪声信号的特点为利用小波分析消除噪声提供了前提条件。对含噪声的信号进行小波分解时，含噪声的部分主要包含在高频小波系数中，因而，可以采用门限阈值等形式对小波系数进行处理，然后对信号进行重构即可达到消除噪声的目的。</font>

**<font style="color:black;">一维信号的消噪过程可以按照以下流程：</font>**

+ <font style="color:black;">对含有噪声的信号进行预处理，便于后续处理；</font>
+ <font style="color:black;">选择一个小波并确定一个分解层次N，然后对信号s进行N层分解；</font>
+ <font style="color:black;">对第一层到第N层的每一个高频系数，选择一个阈值进行软阈值或硬阈值量化处理；</font>
+ <font style="color:black;">根据小波分解的第N层系数和经过量化处理后的高频系数，进行一维信号的重构；</font>

<font style="color:black;">从这几个步骤中可以看出，关键是选取阈值和如何进行阈值量化。</font>

<font style="color:black;">此外，教材中还有轧钢机振动分析、大型矿山电铲系统振动分析、压缩机齿轮箱轴瓦监测诊断、高压透平蒸汽激振分析等例子，这里不再阐述。</font>

