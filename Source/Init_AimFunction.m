function [point,t,f,ppy,phase,period] =Init_AimFunction(Select_AimFunction,sample_seq,SampleFreq,new_point_string)
% 利用CaluFFT函数（实质为FFT算法），计算原信号DFT
% 获得原函数的幅值与相位特性


%% 参数默认值设置及健壮性
if nargin ==3  % 判断参数个数
    new_point_string = 0; % 即正常模式，未从编辑框输入新函数
elseif nargin < 3 
    error('Please input three parameters at least!');% 参数个数少于三个
end

%% 周期扩展，设置主界面显示周期，便于绘图
period = 2;

% 设置主界面显示时序信号
t = -period : 1/SampleFreq : period - 1/SampleFreq;

%% 功能 - 改变原函数

if new_point_string == 0
    point=zeros(1,length(sample_seq));
    switch Select_AimFunction
        case 1 % 方波
            point(1,1:floor(length(sample_seq)*0.5)) = 1;% 占空比为0.5
        case 2 % 方波
            point(1,1:floor(length(sample_seq)*0.1)) = 1;% 占空比为0.1
        case 3 % 方波
            point(1,1:floor(length(sample_seq)*0.01)) = 1;% 占空比为0.01
        case 4 % 三角波函数
            point(1,1:length(sample_seq)/2) = sample_seq(1,1:length(sample_seq)/2);
            point(1,length(sample_seq)/2+1:length(sample_seq)) =  0.5- sample_seq(1,1:length(sample_seq)/2);
        case 5 % 锯齿波函数
            point(1,1:length(sample_seq)) = sample_seq(1,1:length(sample_seq));
    end
else
    x = sample_seq;
    point = eval(new_point_string);
end

% DFT计算 
% 获得幅值特性与相位特性

[f,ppy,phase] = CaluFFT(point,SampleFreq,0);
% 扩展原函数 - 便于绘制
point_period = [];
for i = 1:period*2
    point_period = [point_period,point];
end
point = point_period;




end