function draw_harmonic(m,point,t,f,ppy,phase)
% 绘制m次谐波拟合曲线
hold off

% m次谐波合成图像
Fourier_synthesis = zeros(1,length(point));

for i = 1:m+1
    Fourier_synthesis = Fourier_synthesis + ppy(i).*cos(2*pi*f(i)*t + phase(i));
end
h = plot(t,Fourier_synthesis,'color',[119/255,12/255,176/255]);
set(h,'LineWidth',3*get(h,'LineWidth'));
hold off;
grid on;
axis([-2,2,min(Fourier_synthesis)-0.5,max(Fourier_synthesis)+0.5]);
xlabel('时域角度');
ylabel('信号强度y');

title(strcat(num2str(m),'次谐波拟合图像'))
end


    