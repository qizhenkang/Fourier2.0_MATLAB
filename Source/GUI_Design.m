%% 工程主函数 - 用于设置主界面
% 定义程序主界面标题、字体大小、界面大小等
set ( gcf,'defaultuicontrolfontsize',11)   
set ( gcf, 'unit','normalized','position', [0.65,0.1,0.5,0.75]) 
set ( gcf,'defaultuicontrolunits','normalized') 
set(gcf,'defaultuicontrolfontname','None') 
set(gcf,'defaultuicontrolhorizontal','left') 

str = '傅里叶级数的可视化 V2.0 From 知乎@电工李达康';
set(gcf,'menubar','none')
set(gcf,'name',str,'numbertitle','off');

%% 建立四个图形对象
h_axes_3d=axes('position',[0.1,0.40,0.55,0.55],'visible','on'); % axes布局 整个界面有四个axes对象
h_axes_f=axes('position',[0.1,0.07,0.2,0.2],'visible','on');
h_axes_nh=axes('position',[0.7,0.07,0.2,0.2],'visible','on');
h_axes_zz=axes('position',[0.4,0.07,0.2,0.2],'visible','on');

draw_all(3,point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz); % 自定义函数 draw_all() 用于绘制上述四个图像

%% 背景信息
background = background_words;

%% 菜单对象的定义 
% 设置'文件'和'关于'菜单
H_file = uimenu(gcf,'Label','文件'); 
H_about = uimenu(gcf,'Label','关于');

% 设置'文件'下拉内容及对应的callback函数
H_save = uimenu(H_file,'Label','保存图像');  % 保存图像选项设置
H_print = uimenu(H_file,'Label','打印预览','callback','printpreview');  % 保存图像选项设置
H_exit = uimenu(H_file,'Label','退出','callback','close(gcf)');  % 保存图像选项设置

% 设置'文件'-'保存图像'内容选项
H_save3d = uimenu(H_save,'Label','3d图像','callback','filesave(h_axes_3d)'); %自定义函数 filesave() 保存图像
H_savef = uimenu(H_save,'Label','幅频特性图像','callback','filesave(h_axes_f)');
H_savezz = uimenu(H_save,'Label','各次谐波图像','callback','filesave(h_axes_zz)');
H_savenh = uimenu(H_save,'Label','拟合图像','callback','filesave(h_axes_nh)');

% 设置'关于'下拉内容及对应的callback函数
H_background = uimenu(H_about,'Label','选题背景','callback','helpdlg(background,''选题背景'')');
H_ME = uimenu(H_about,'Label','作者信息','callback','helpdlg({''MADE BY 知乎@电工李达康'';''Version 2.0'';''Email:qizhenkang@sina.com''},''作者信息'')');


% H_ex = uimenu(gcf,'Label','风格');
% H_exgray=uimenu(H_ex,'Label','灰色背景','callback','set(gcf,''Color'',[0.8 0.8 0.8])');
% H_exgrid=uimenu(H_ex,'Label','Grid','callback','grid on');

%% 创建面板对象，设置字体大小位置等
uipanel(gcf,'Title','请选择傅里叶展开的级数：','FontSize',12,'Position',[0.67,0.4,0.31,0.29]); % panel 布局

%% 用户控件的定义
% 用到了以下控件：
%   popup	-	弹出框
%   edit	-   编辑框
%   text    -   静态文本
%   pushbutton  -   按钮
%   radiobutton -   单选按钮
hpop = uicontrol(gcf,'Style','popup','position',[0.77,0.45,0.13,0.12],'string','3次展开|5次展开|9次展开|22次展开');
hedit = uicontrol(gcf,'Style','edit','position',[0.77,0.43,0.045,0.030]);
uicontrol(gcf,'Style','text','position',[0.825,0.410,0.1,0.05],'String','次展开');
hbutton = uicontrol( gcf,'Style','pushbutton','position',[0.7, 0.33, 0.25, 0.05],'string','查看当前函数的动态拟合过程');

hradio_one = uicontrol(gcf,'Style','radiobutton','position',[0.7,0.58,0.25,0.05],'string','选择展开级数：');
hradio_two = uicontrol(gcf,'Style','radiobutton','position',[0.7,0.47,0.25,0.05],'string','自定义展开级数：');
set(hradio_one,'value',1); % 设置默认值
set(hradio_two,'value',0);

% 设置各控件的callback函数
set(hedit,'string','128','callback','axes(h_axes_3d);[point,t,f,ppy,phase,period]=calledit( hedit,hedit_point, hpop,hpop_point,hradio_one.Value,hradio_point_one.Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')
set(hpop,'callback','axes(h_axes_3d);[point,t,f,ppy,phase,period]=calledit( hedit,hedit_point, hpop,hpop_point,hradio_one.Value,hradio_point_one.Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')
set(hbutton,'callback','draw_dynamic_process(point,t,f,ppy,phase,period)')

set(hradio_one,'callback','[point,t,f,ppy,phase,period]=radio_one_Callback(hradio_one,hradio_two,hradio_point_one,hradio_point_two,hedit,hedit_point, hpop,hpop_point,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')
set(hradio_two,'callback','[point,t,f,ppy,phase,period]=radio_two_Callback(hradio_one,hradio_two,hradio_point_one,hradio_point_two,hedit,hedit_point, hpop,hpop_point,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')

grid on


%% V2.0新增内容 - 选择原函数

% 创建面板对象，设置字体大小位置等
uipanel(gcf,'Title','请选择需要您需要的时域函数：','FontSize',12,'Position',[0.67,0.70,0.31,0.29]); % panel 布局

% uicontrol(gcf,'Style','text','string','时域函数选择：','position',[0.675,0.84,0.25,0.05]);
hpop_point = uicontrol(gcf,'Style','popup','position',[0.77,0.76,0.16,0.12],'string','方波（0.5占空比）|方波（0.1占空比）|方波（0.01占空比）|三角波|锯齿波');
set(hpop_point,'callback','axes(h_axes_3d);[point,t,f,ppy,phase,period]=calledit( hedit,hedit_point, hpop,hpop_point,hradio_one.Value,hradio_point_one.Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')

uicontrol(gcf,'Style','text','string','f(x)=','position',[0.73,0.715,0.10,0.05]);
hedit_point = uicontrol(gcf,'Style','edit','position',[0.77,0.73,0.16,0.04]);
set(hedit_point,'string','10*(x-0.5).^3','callback','axes(h_axes_3d);[point,t,f,ppy,phase,period]=calledit( hedit,hedit_point, hpop,hpop_point,hradio_one.Value,hradio_point_one.Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')

% 选择时域函数
hradio_point_one = uicontrol(gcf,'Style','radiobutton','position',[0.7,0.90,0.13,0.05],'string','常用函数：');
hradio_point_two = uicontrol(gcf,'Style','radiobutton','position',[0.7,0.78,0.25,0.05],'string','自定义:<如:10*(x-0.5).^3>');
set(hradio_point_one,'value',1); % 设置默认值
set(hradio_point_two,'value',0);

set(hradio_point_one,'callback','[point,t,f,ppy,phase,period]=radio_point_one_Callback(hradio_one,hradio_two,hradio_point_one,hradio_point_two,hedit,hedit_point, hpop,hpop_point,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')
set(hradio_point_two,'callback','[point,t,f,ppy,phase,period]=radio_point_two_Callback(hradio_one,hradio_two,hradio_point_one,hradio_point_two,hedit,hedit_point, hpop,hpop_point,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')

