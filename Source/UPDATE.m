%% CaluFFT测试函数
% 设置采样比
SampleFreq = 1024;

% 生成采样序列
t = 0 : 1/SampleFreq : 1 - 1/SampleFreq; 
x=zeros(1,length(t));
% 生成目标信号函数 即方波
x(1,1:length(t)/2) = 1;

% 暂未添加随机噪声
point = x ;%+ 1*randn(size(t));

% DFT计算
[f,ppy] = CaluFFT(point,SampleFreq,0);
title('Frequency Domain of point');

figure
t = linspace(-1,1,length(ppy));
hold on
for i = 1:512
    plot3(f(i)*ones(1,length(t)),t,ppy(i).*cos(2*pi*f(i)*t));
end
grid on;
hold off
xlabel('频域角度');
ylabel('时域角度');
zlabel('信号强度');
