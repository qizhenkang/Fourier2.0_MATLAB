function draw_mainpicture(m,point,t,f,ppy,phase,period)
%矩形信号串---信号分解与合成
% m - 对应展开至m次谐波

%% 设置程序默认值
if (nargin<1)
    m=9;% 默认展开9次谐波
end


hold off;% 此时hold off 用以每次更改m时重新生成一幅新的图（你可以试试不hold off会有什么细节变化）


figure_point = plot3(-1*ones(1,length(t)),t,point);% 绘制原函数
set(figure_point,'LineWidth',3*get(figure_point,'LineWidth'));% 设置原函数线宽为 3

hold on

% 绘制各次谐波
for i = 1:m+1
    plot3(f(i)*ones(1,length(t)),t,ppy(i).*cos(2*pi*f(i)*t + phase(i)));
end



%% 绘制m次谐波合成图像
Fourier_synthesis = zeros(1,length(point));

for i = 1:m+1
    Fourier_synthesis = Fourier_synthesis + ppy(i).*cos(2*pi*f(i)*t + phase(i));
end
h = plot3((m+1)*ones(1,length(t)),t,Fourier_synthesis,'color',[119/255,12/255,176/255]);
set(h,'LineWidth',3*get(h,'LineWidth'));

%% 绘制频域幅值图

h=stem3(f(1,1:m+1),period*ones(1,m+1),ppy(1,1:m+1),'color',[244/255,159/255,47/255]);
set(h,'LineWidth',3*get(h,'LineWidth'));

%% 格式设置

grid on % 打开坐标线
hold off % 关闭hold

title('周期信号的傅里叶展开的可视化');% 设置标题
view(-49,23) % 设置三维图初始视角
set(gca,'XTick',-1:1:m); % 设置坐标轴刻度
set(gca,'YTick',-period-1:1:period+1);
set(gca,'ZTick',min([point - 1,-1.5,-ppy(2)]):0.5:max([point+1,1.5,ppy(1),ppy(2)]));% 动态设置坐标轴刻度

% 设置坐标轴显示范围
axis([-1,m+1,-period,period,min([point - 1 , -1.5,-ppy(2)]),max([point+1,1.5,ppy(1),ppy(2)])]);% 动态设置显示范围

xlabel('频域角度');
ylabel('时域角度');
zlabel('信号强度');

% 添加注释文字
text(m/2,period-0.1,max([point+1,1.5,ppy(1),ppy(2)]),'幅频特性','color',[244/255,159/255,47/255],'FontWeight','bold');
text(m+1,1,max([point+1,1.5,ppy(1),ppy(2)]),[num2str(m),'级展开拟合图'],'color',[119/255,12/255,176/255],'FontWeight','bold');
text(-1,1,0.5*(max(point)+min(point)),'原函数','color',[17/255,122/255,228/255],'FontWeight','bold');

end

