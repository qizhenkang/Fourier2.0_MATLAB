function radio_two_Callback(hradio_one,hradio_two,hedit, hpop,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)
set(hradio_one,'value',0);
set(hradio_two,'value',1);
calledit(hedit, hpop,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz,hradio_one.Value);