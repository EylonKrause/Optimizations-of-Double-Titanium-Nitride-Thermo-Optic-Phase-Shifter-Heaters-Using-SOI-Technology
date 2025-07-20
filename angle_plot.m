%%

close all;
clear; clc

%Load files: 
addpath("C:\Users\Administrator\Documents\Lumerical\Angles")
% set_plot{1} = load("C:\Users\Eylon\Documents\Lumerical\Angles\2H0angle\TwoH0.mat");
% set_plot{2} = load("C:\Users\Eylon\Documents\Lumerical\Angles\2H15angle\TwoH15.mat");
% set_plot{3} = load("C:\Users\Eylon\Documents\Lumerical\Angles\2H30angle\TwoH30.mat");
% set_plot{4} = load("C:\Users\Eylon\Documents\Lumerical\Angles\2H45angle\TwoH45.mat");

set_plot{1} = load("C:\Users\Administrator\Documents\Lumerical\Angles\2H0angle\TwoH0.mat");
set_plot{2} = load("C:\Users\Administrator\Documents\Lumerical\Angles\2H15angle\TwoH15.mat");
set_plot{3} = load("C:\Users\Administrator\Documents\Lumerical\Angles\2H30angle\TwoH30.mat");
set_plot{4} = load("C:\Users\Administrator\Documents\Lumerical\Angles\2H45angle\TwoH45.mat");

%Plot: 
ax1 = axes;
space = "";
point = [];

for n = 1:length(set_plot)
space = append(space,"\n\n");

pi_line_x = 10e2*[set_plot{n}.lum.x0(1,1) set_plot{n}.lum.x0(1,length(set_plot{n}.lum.x0))];
pi_line_y = ones(1,2)*pi;

P = 10e2*InterX([pi_line_x;pi_line_y],[set_plot{n}.lum.x0;set_plot{n}.lum.y0]);

point(1, n) = plot(10e2.*set_plot{n}.lum.x0, set_plot{n}.lum.y0);
hold on;
plot(P(1,:), pi, 'ro');
title('phase shift as a function of power');
set(get(ax1, 'XLabel'), 'String', 'power [mW]');
set(get(ax1, 'XLabel'), 'FontSize', 16);
set(get(ax1, 'XLabel'), 'FontWeight', 'bold');
set(get(ax1, 'YLabel'), 'String', 'phase [rad]');
set(get(ax1, 'YLabel'), 'FontSize', 16);
set(get(ax1, 'YLabel'), 'FontWeight', 'bold');
set(ax1, 'XLim', [0 10e2*0.03]);
set(ax1, 'YLim', [0 7]);
set(ax1,'XGrid', 'on');
set(ax1,'YGrid', 'on');
line(pi_line_x, pi_line_y, 'Color', 'r', 'LineStyle', '-.');
    
msg = sprintf(append(space,['    (' num2str(P(1,:)) ',' num2str(pi) ')']));
text(P(1,:), pi,msg);

xlim([0 20]);
ylim([0 1.5*pi]);

end 
legend([point(1,1:n)], '0 degrees','15 degrees','30 degrees','45 degrees', 'Location', 'south east');

hold off;
