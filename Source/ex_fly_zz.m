function ex_fly_zz(m)
    T1=2;T0=4;
    if (nargin<1)
        m=9;
    end
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

    for k=1:m
        x=x+2*a*sinc(a*k)*cos(2*pi*t*k/T0);
        y(k,:)=x;
    end

 
    hold off;
    h=plot(t,y(1:m+1,:)-0.5);
    hold on;
    axis([-6,6,-1,1]); % 显示矩形脉冲串
    title('各次谐波（正视图）');
    xlabel('时域角度');
    grid;
end