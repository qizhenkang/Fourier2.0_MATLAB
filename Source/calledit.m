function [point,t,f,ppy,phase,period] = calledit(hedit,hedit_point, hpop,hpop_point,hradio_one_value,hradio_point_one_Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)
% panel内radiobutton等控件的回调函数
% 用于修改原函数

% 获得编辑框和弹出框的值
ct = get(hedit,'string');
vpop = get (hpop,'value');

% 功能 - 改变原函数
vpop_point = get (hpop_point,'value'); % 方法一：常用函数选择
new_point_string = get(hedit_point,'string'); % 方法二：自定义函数

if hradio_point_one_Value == 1 % 常用函数选择
    [point,t,f,ppy,phase,period] = Init_AimFunction(vpop_point,sample_seq,SampleFreq);
elseif new_point_string % 自定义函数
    [point,t,f,ppy,phase,period] = Init_AimFunction(vpop_point,sample_seq,SampleFreq,new_point_string);
end




if~isempty(vpop)
    popstr = {'draw_all(3,point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);',...
        'draw_all(5,point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)',...
        'draw_all(9,point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)',...
        'draw_all(22,point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)'};

    cct = str2double(ct);
    if hradio_one_value == 1 % 根据单选框选项，决定绘图
        eval(popstr{vpop})
    else
        if ~isnan(cct) && cct>0 && cct <= 0.5*SampleFreq
            eval(['draw_all(',ct,',point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)'])
        elseif ~isempty(ct) && cct <= 0.5*SampleFreq
            errordlg('请输入一个正阿拉伯数字，如：17','提示');
        elseif cct > 0.5*SampleFreq
            errordlg('数字超出范围！请输入一个小于0.5采样频率的数（默认最大值为0.5*1024=512）','提示');
        end
    end
end
end