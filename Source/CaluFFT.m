function [f,ppy,phase]=CaluFFT(point,SampleFreq,log,calcu_length)
%Calculate DFT
%   [f,ppy]=CaluFFT(point,SampleFreq,log)
% INPUT PARAMETERS
%   'point' - The array of input signals
%   'SampleFreq' - Sample Frequency
%   'log' -  The format of amplitude
%         -  0 primary (default)
%         -  1 db
% OUTPUT PARAMETERS
%   'f' - Real Frequency Domain
%   'ppy' - Amplitude of corresponding frequency 
%   'length' - The calculation length of DFT

%% 参数默认值设置及健壮性
if nargin ==2  % 判断参数个数
    log = 0; % 默认值为0 即纵坐标为正常幅值
elseif nargin == 3
    calcu_length = length(point);
elseif nargin <2 
    error('Please input two parameters at least!');%参数个数少于两个
end

%% FFT计算信号频谱
N = length(point);% 确定信号长度
Yf = fft(point,calcu_length);% 求频谱
%% 信号频谱绘图
fm = floor(N/2); % 确定绘频谱图的上限频率 
f = (0:fm) * SampleFreq/N; % 确定绘频谱图的频率刻度 
ppy = abs(Yf) / (N/2);% 计算真实幅值
ppy(:,1) = ppy(:,1)/2;
ppy(:,floor(N/2)) = ppy(:,floor(N/2))/2;
phase = angle(Yf);
if log == 1 % 分贝刻度
    ppy = 20*log10(ppy);
end
% figure;
% plot(f,ppy(1:length(f))); % 绘制原波形频谱图 
ppy = ppy(:,1:fm+1);
phase = phase(:,1:fm+1);
% title('Frequency Domain of point');
% xlabel('frequency (Hz)');
% if log == 1 % 分贝刻度
%     ylabel('Amplitude (dB)');
% else
%     ylabel('Amplitude ');
% end