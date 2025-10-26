---
title: Fully connected neural network  
date: 2025-05-28 19:50:15  
categories: [Signal Processing, Machine Learning]  
tags: [python, neural network]     # TAG names should always be lowercase  
description: A fully connected neural network (FCNN), also known as a multilayer perceptron (MLP, 多层感知器), is a type of artificial neural network where every neuron in one layer is connected to every neuron in the subsequent layer.    
toc: true  
math: true
---

![](/assets/images/20250704008_FCNN1.png)![](/assets/images/20250704008_FCNN2.png)

## FCNN

FCNN是一种最基础的人工神经网络结构，也称为多层感知器。Within FCNN, every neuron in one layer is connected to every neuron in the adjcent layers. It can learn the complex features from the input data, which is helpful for classification and regression tasks.

## the structures of FCNN

+ input layer: input layer is responsible for the receiving the original data and transfing to the next layer. The number of neurons in input layer depends on the dimesions of input data.
+ hidden layer: hidden layer is the middle layer of FCNN, which may have multi-layer. The number of neurons each layer is defined by users.
+ output layer: output layer is the last layer of FCNN, which is the predicted result of the input data. The number of neurons depends on the type of tasks.

## Reference

[1] [https://zhuanlan.zhihu.com/p/104576756](https://zhuanlan.zhihu.com/p/104576756)

[2] [https://blog.csdn.net/weixin_40928633/article/details/120088667](https://blog.csdn.net/weixin_40928633/article/details/120088667)
