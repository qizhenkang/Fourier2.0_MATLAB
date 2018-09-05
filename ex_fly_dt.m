T1=2;T0=4;m=9;
t1=-T1/2:0.01:T1/2;
t2=T1/2:0.01:(T0-T1/2);
t=[(t1-T0)';(t2-T0)';t1';t2';(t1+T0)']; 
n1=length(t1);
n2=length(t2);
f=[ones(n1,1);zeros(n2,1);ones(n1,1);zeros(n2,1);ones(n1,1)];
y=zeros(m+1,length(t));
y(m+1,:)=f';
a=T1/T0;
x=a*ones(size(t));
figure;
for k=1:2:m+2 % 循环显示谐波叠加图形
    pause(0.5);
    x=x+2*a*sinc(a*k)*cos(2*pi*t*k/T0);
    y(k,:)=x;% 计算叠加和
    plot(t,y(m+1,:));
    hold on;
    h=plot(t,y(k,:));% 绘制各次叠加信号
    set(h,'LineWidth',3*get(h,'LineWidth'));
    hold off;
    grid;
    axis([-(T0+T1/2)-0.5,(T0+T1/2)+0.5,-0.5,1.5]);
    title(strcat(num2str(k),'次谐波叠加'));
    xlabel('时域角度');
end

title('谐波拟合');
xlabel('t');
grid on;