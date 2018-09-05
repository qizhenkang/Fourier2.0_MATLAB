function ex_fly_f(m)
T1=2;T0=4;
t1=-T1/2:0.01:T1/2;
t2=T1/2:0.01:(T0-T1/2);
t=[(t1-T0)';(t2-T0)';t1';t2';(t1+T0)']; 


a=T1/T0;

freq=0:1:m;
mag=2*a*sinc(a*freq);
h=stem(freq,mag,'color',[244/255,159/255,47/255]);
set(h,'LineWidth',3*get(h,'LineWidth'));

axis([0,m+1,-0.5,1])
title('¿Î…¢∑˘∂»∆◊£®≤‡ ”Õº£©');
xlabel('∆µ”Ú∑∂Œßf');
grid on;
end