function draw_all(m,point,t,f,ppy,phase,period, h_axes_3d, h_axes_f, h_axes_nh,h_axes_zz)
% 绘制/更新所有图像

% 更新3d主图
axes(h_axes_3d);
rotate3d on;
draw_mainpicture(m,point,t,f,ppy,phase,period)

% 更新频谱幅值图
axes(h_axes_f);
draw_frequency(m,f,ppy)
% axes(h_axes_3d);

% 更新频谱相位图
axes(h_axes_zz);
draw_phase(m,f,phase)
% axes(h_axes_3d);

% 更新m次拟合图
axes(h_axes_nh);
draw_harmonic(m,point,t,f,ppy,phase)
% axes(h_axes_3d);


end