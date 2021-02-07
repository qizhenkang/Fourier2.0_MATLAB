function [point,t,f,ppy,phase,period] = radio_point_one_Callback(hradio_one,hradio_two,hradio_point_one,hradio_point_two,hedit,hedit_point, hpop,hpop_point,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)

set(hradio_point_one,'value',1);
set(hradio_point_two,'value',0);
[point,t,f,ppy,phase,period]=calledit( hedit,hedit_point, hpop,hpop_point,hradio_one.Value ,hradio_point_one.Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);
end
