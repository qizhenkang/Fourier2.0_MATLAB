function filesave(handle)
    axes(handle);
    if isempty(handle)
        return;
    end
    newFig = figure; %保存在新建的figure中的谱图
    set(newFig,'Visible','off') %设置新建的figure为不可见
    newAxes = copyobj(handle,newFig);%将图复制到新建的figure中
    set(newAxes,'Units','default','Position','default'); %设置图显示的位置
    [filename,pathname] = uiputfile({ '*.jpg','figure type(*.jpg)'}, '保存图像','untitled');
    if isequal(filename,0)||isequal(pathname,0) % 如果选择“取消”，则退出
        return;
    else
        fpath=fullfile(pathname,filename);
    end
    %imwrite(newFig,fpath);%如果用户选择“取消”，则退出
    f = getframe(newFig);
    f = frame2im(f);
    imwrite(f, fpath);
end