% 矩形信号串---信号分解与合成
% T1：矩形信号区间为（-T1/2,T1/2)
% T0: 矩形信号串周期
% m: 傅里叶级数展开项次数

function ex_fly_nh(m)
    hold off;
    if (nargin<1)
        m=9;
    end
    T1=2;T0=4;
    t1=-T1/2:0.01:T1/2;
    t2=T1/2:0.01:(T0-T1/2);
    t=[(t1-T0)';(t2-T0)';t1';t2';(t1+T0)']; 
    n1=length(t1);
    n2=length(t2);
    f=[ones(n1,1);zeros(n2,1);ones(n1,1);zeros(n2,1);ones(n1,1)];% 构造周期矩形信号串
    y=zeros(m+1,length(t));
    y(m+1,:)=f';
    a=T1/T0;
    H=a*ones(size(t));
    for k=1:m
        H=H+2*a*sinc(a*k)*cos(2*pi*t*k/T0);
    end
    ht = plot(t,y(m+1,:)-0.5);
    set(ht,'LineWidth',2*get(ht,'LineWidth'));
    hold on;
    h = plot(t,H-0.5,'color',[119/255,12/255,176/255]);
    set(h,'LineWidth',3*get(h,'LineWidth'));
    hold off;
    grid on;
    %set(gca,'XTick',-m:1:m);
    %set(gca,'YTick',-0.2:0.1:0.7);
    axis([-6,6,-1,1]);
    xlabel('时域角度');
    ylabel('信号强度y');
    
    title(strcat(num2str(m),'次谐波拟合图像'))
    
    