load C:/Users/Eylon/Documents/Lumerical/2H0angle/TwoH0.mat;
ax1 = axes; 
plot(lum.x0, lum.y0)
set(get(ax1, 'XLabel'), 'String', 'power (W)')
set(get(ax1, 'XLabel'), 'FontSize', 16)
set(get(ax1, 'XLabel'), 'FontWeight', 'bold')
set(get(ax1, 'YLabel'), 'String', 'phase')
set(get(ax1, 'YLabel'), 'FontSize', 16)
set(get(ax1, 'YLabel'), 'FontWeight', 'bold')
set(ax1, 'XLim', [0 0.03])
set(ax1, 'YLim', [0 8])
set(ax1,'XGrid', 'on')
set(ax1,'YGrid', 'on')
legend('line 1')
