function draw_frequency(m,f,ppy)
% 频谱绘制
% f - 频率大小
% ppy - 对应幅值大小
h=stem(f(1,1:m+1),ppy(1,1:m+1),'color',[244/255,159/255,47/255]);
set(h,'LineWidth',3*get(h,'LineWidth'));
axis([0,m+1,min(ppy(1,1:m+1)),1.25 * max(ppy(1,1:m+1))])
title('离散幅度谱（侧视图）');
xlabel('频域范围f');
grid on
end