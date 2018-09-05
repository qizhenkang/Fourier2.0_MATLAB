% 矩形信号串---信号分解与合成
% T1：矩形信号区间为（-T1/2,T1/2)
% T0: 矩形信号串周期
% m: 傅里叶级数展开项次数
function ex_fly_one(m)
    hold off;
    if (nargin<1)
        m=9;
    end
    T1=2;T0=4;
    t1=-T1/2:0.01:T1/2;
    t2=T1/2:0.01:(T0-T1/2);
    t=[(t1-T0)';(t2-T0)';t1';t2';(t1+T0)']; 
    n1=length(t1);
    n2=length(t2); % 根据周期矩形信号函数周期，计算点数
    f=[ones(n1,1);zeros(n1,1);ones(n1,1);zeros(n1,1);ones(n1,1)];% 构造周期矩形信号串
    y=zeros(m+1,length(f));
    y(m+1,:)=f'-0.5;
    h=plot3(t-t,t,y(m+1,:)); % 绘制周期矩形信号串
    hold on;

    set(h,'LineWidth',3*get(h,'LineWidth')); % 设置图形的线宽为原来的3倍
    axis([0,m+1,-T0-2,T0+2,-1,2])
    set(gca,'XTick',-T0-1:1:m);
    set(gca,'YTick',-T0-1:1:T0+1);
    set(gca,'ZTick',-1:0.5:T0);
    title('周期信号的傅里叶展开的可视化');
    view(-49,23)
    grid on;


    tt = 1:0.01:m+1;
    a=T1/T0;%绘制离散幅度谱
    freq=1:1:m;
    plot3(tt,T0+2+tt-tt,a*sinc(a*tt)*5)
    mag=a*sinc(a*freq)*5;
    h=stem3(freq,T0+2+freq-freq,mag);
    set(h,'LineWidth',3*get(h,'LineWidth'));
     x=a*ones(size(t));
     H=a*ones(size(t));

    for k=1:m 
        x=2*a*sinc(a*k)*cos(2*pi*t*k/T0);
        H=H+2*a*sinc(a*k)*cos(2*pi*t*k/T0);
        y(k,:)=x;% 计算叠加和
        h=plot3(k+ t-t,t,y(k,:));% 绘制各次叠加信号
        set(h,'LineWidth',3*get(h,'LineWidth'));
        grid;
    end
    h = plot3(k+1+t-t,t,H-0.5);
    set(h,'LineWidth',3*get(h,'LineWidth'));
    grid on;
    xlabel('频域角度');
    ylabel('时域角度');
    zlabel('信号强度');
    text(m/2,T0+2,1.75,'幅频特性','color',[244/255,159/255,47/255],'FontWeight','bold');
    text(m+1,1,1.75,[num2str(m),'级展开拟合图'],'color',[119/255,12/255,176/255],'FontWeight','bold');
    text(0,1,-0.5,'原函数(方波信号)','color',[17/255,122/255,228/255],'FontWeight','bold');
end
