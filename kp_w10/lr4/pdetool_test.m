function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',9);
pdetool('snapon','on');
set(ax,'DataAspectRatio',[1 1.3503119823954652 1.7984829911124729]);
set(ax,'PlotBoxAspectRatio',[1 1 1]);
set(ax,'XLim',[-0.069440184375771846 1.0426081418432469]);
set(ax,'YLim',[-0.26826509802381115 1.2333470818725512]);
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');
pdetool('gridon','on');

% Geometry description:
pderect([0 1 0 1],'SQ1');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','SQ1')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(4,...
'neu',...
1,...
'0',...
'0')
pdesetbd(3,...
'neu',...
1,...
'8',...
'400')
pdesetbd(2,...
'neu',...
1,...
'0',...
'0')
pdesetbd(1,...
'dir',...
1,...
'1',...
'10')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
pdetool('initmesh')
pdetool('refine')
pdetool('refine')

% PDE coefficients:
pdeseteq(1,...
'1.0',...
'0',...
'(1100*(sin(3*x) + cos(4*y)))+(0).*(0.0)',...
'(1.0).*(1.0)',...
'0:10',...
'0.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1.0                       ';...
'1.0                       ';...
'1.0                       ';...
'1100*(sin(3*x) + cos(4*y))';...
'0                         ';...
'0.0                       '])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
str2mat('0','7872','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 0 0 0 1 1 1 0 1 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');

% Solve PDE:
pdetool('solve')
