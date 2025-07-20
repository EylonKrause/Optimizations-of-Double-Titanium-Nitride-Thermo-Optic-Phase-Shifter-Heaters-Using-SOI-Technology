load C:/Users/Eylon/Documents/Lumerical/Heater_center_distance/temp/WG/1535.mat;
ax1 = axes('NextPlot','add'); 
ax2 = axes('YAxisLocation','right','Color','none','NextPlot','add'); 
colorOrder = get(ax1,'ColorOrder'); 
coSize = size(colorOrder); 
ln0=line(lum.x0, lum.y0,'Parent',ax1, 'Color', colorOrder(mod(0,coSize(1))+1,:))
ln1=line(lum.x1, lum.y1,'Parent',ax2, 'Color', colorOrder(mod(1,coSize(1))+1,:))
set(get(ax1, 'XLabel'), 'String', 'power (W)')
set(get(ax1, 'XLabel'), 'FontSize', 16)
set(get(ax1, 'XLabel'), 'FontWeight', 'bold')
set(get(ax1, 'YLabel'), 'String', 'real(phase)')
set(get(ax1, 'YLabel'), 'FontSize', 16)
set(get(ax1, 'YLabel'), 'FontWeight', 'bold')
set(get(ax2, 'YLabel'), 'String', 'imag(phase)')
set(get(ax2, 'YLabel'), 'FontSize', 16)
set(get(ax2, 'YLabel'), 'FontWeight', 'bold')
set(ax1, 'XLim', [0 0.03])
set(ax1, 'YLim', [-0.5 5])
set(ax2, 'XLim', [0 0.03])
set(ax2, 'YLim', [6e-014 2.4e-013])
set(ax1,'XGrid', 'on')
set(ax1,'YGrid', 'on')
legend([ln0;ln1],{'line 1','line 2'})
