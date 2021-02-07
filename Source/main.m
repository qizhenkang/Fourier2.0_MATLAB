clc
clear
clf reset 
%% 原函数发生
% 设置采样频率
SampleFreq = 1024; 
% 重要参数 采样频率决定了频域展开的最高次为 0.5*SampleFreq
% 即，自定义展开级数的最大值默认为512

% 生成采样序列
sample_seq = 0 : 1/SampleFreq : 1 - 1/SampleFreq; 

% 产生原函数，并计算其频域幅值、相位特性
Select_AimFunction = 1;% 默认为方波函数 0.5占空比
[point,t,f,ppy,phase,period] = Init_AimFunction(Select_AimFunction,sample_seq,SampleFreq);

%% GUI设计 - 用于设置主界面
GUI_Design;



