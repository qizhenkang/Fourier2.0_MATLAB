clf reset 

set ( gcf,'defaultuicontrolfontsize',11)   % 定义程序主界面标题、字体大小、界面大小等
set ( gcf, 'unit','normalized','position', [0.65,0.1,0.5,0.75]) 
set ( gcf,'defaultuicontrolunits','normalized') 
set(gcf,'defaultuicontrolfontname','None') 
set(gcf,'defaultuicontrolhorizontal','left') 

str = '傅里叶级数的可视化';
set(gcf,'menubar','none')
set(gcf,'name',str,'numbertitle','off');


h_axes_3d=axes('position',[0.1,0.40,0.55,0.55],'visible','on'); % axes布局 整个界面有四个axes对象

h_axes_f=axes('position',[0.1,0.07,0.2,0.2],'visible','on');
h_axes_nh=axes('position',[0.7,0.07,0.2,0.2],'visible','on');
h_axes_zz=axes('position',[0.4,0.07,0.2,0.2],'visible','on');

draw_all(3,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz); % 自定义函数 draw_all() 用于绘制上述四个图像

background = ex_words;

H_file = uimenu(gcf,'Label','文件'); % 菜单定义
H_about = uimenu(gcf,'Label','关于');

H_background = uimenu(H_about,'Label','选题背景','callback','helpdlg(background,''选题背景'')');
H_ME = uimenu(H_about,'Label','作者信息','callback','helpdlg({''By QIZHENKANG'';''SEU''},''作者信息'')');



H_save = uimenu(H_file,'Label','保存图像');  % 保存图像选项设置
H_print = uimenu(H_file,'Label','打印预览','callback','printpreview');  % 保存图像选项设置
H_exit = uimenu(H_file,'Label','退出','callback','close(gcf)');  % 保存图像选项设置


H_save3d = uimenu(H_save,'Label','3d图像','callback','filesave(h_axes_3d)'); %自定义函数 filesave() 保存图像
H_savef = uimenu(H_save,'Label','幅频特性图像','callback','filesave(h_axes_f)');
H_savezz = uimenu(H_save,'Label','各次谐波图像','callback','filesave(h_axes_zz)');
H_savenh = uimenu(H_save,'Label','拟合图像','callback','filesave(h_axes_nh)');

% H_ex = uimenu(gcf,'Label','风格');
% H_exgray=uimenu(H_ex,'Label','灰色背景','callback','set(gcf,''Color'',[0.8 0.8 0.8])');
% H_exgrid=uimenu(H_ex,'Label','Grid','callback','grid on');


uipanel(gcf,'Title','请选择傅里叶展开的级数：','FontSize',12,'Position',[0.67,0.56,0.31,0.35]); % panel 布局

hpop = uicontrol(gcf,'Style','popup','position',[0.77,0.67,0.13,0.12],'string','3次展开|5次展开|9次展开|22次展开');
hedit = uicontrol(gcf,'Style','edit','position',[0.77,0.63,0.045,0.030]);
uicontrol(gcf,'Style','text','position',[0.825,0.610,0.1,0.05],'String','次展开');
hbutton = uicontrol( gcf,'Style','pushbutton','position',[0.7, 0.4, 0.25, 0.05],'string','查看傅里叶级数动态拟合过程');

hradio_one = uicontrol(gcf,'Style','radiobutton','position',[0.7,0.8,0.25,0.05],'string','选择展开级数：');
hradio_two = uicontrol(gcf,'Style','radiobutton','position',[0.7,0.67,0.25,0.05],'string','自定义展开级数：');
set(hradio_one,'value',1);
set(hradio_two,'value',0);

set(hedit,'callback','axes(h_axes_3d);calledit( hedit, hpop,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz,hradio_one.Value)')
set(hpop,'callback','axes(h_axes_3d);calledit( hedit, hpop,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz,hradio_one.Value)')
set(hbutton,'callback','ex_fly_dt')

set(hradio_one,'callback','radio_one_Callback(hradio_one,hradio_two,hedit, hpop,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)')
set(hradio_two,'callback','radio_two_Callback(hradio_one,hradio_two,hedit, hpop,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)')

grid on;