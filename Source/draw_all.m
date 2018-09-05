function draw_all(m, h_axes_3d, h_axes_f, h_axes_nh,h_axes_zz)

axes(h_axes_3d); 
rotate3d on;
ex_fly_one(m)

axes(h_axes_f);
ex_fly_f(m)
axes(h_axes_3d);


axes(h_axes_nh);
ex_fly_nh(m)
axes(h_axes_3d);

axes(h_axes_zz);
ex_fly_zz(m)
axes(h_axes_3d);

end