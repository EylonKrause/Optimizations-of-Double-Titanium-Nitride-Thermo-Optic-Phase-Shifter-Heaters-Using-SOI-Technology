%%

close all;
clear; clc

load C:/Users/Eylon/Documents/Lumerical/MODE/2H90angle/TwoH90.mat;
ax1 = axes; 

pi_line_x = [lum.x0(1,1) lum.x0(1,length(lum.x0))];
pi_line_y = ones(1,2)*pi;

P = InterX([pi_line_x;pi_line_y],[lum.x0;lum.y0]);

plot(lum.x0, lum.y0, P(1,:), pi, 'ro');
title('2 heaters at 90 angle');
set(get(ax1, 'XLabel'), 'String', 'power [W]')
set(get(ax1, 'XLabel'), 'FontSize', 16)
set(get(ax1, 'XLabel'), 'FontWeight', 'bold')
set(get(ax1, 'YLabel'), 'String', 'phase [rad]')
set(get(ax1, 'YLabel'), 'FontSize', 16)
set(get(ax1, 'YLabel'), 'FontWeight', 'bold')
set(ax1, 'XLim', [0 0.03])
set(ax1, 'YLim', [0 5])
set(ax1,'XGrid', 'on')
set(ax1,'YGrid', 'on')

line(pi_line_x, pi_line_y, 'Color', 'r', 'LineStyle', '-.');

msg = sprintf(['\n(' num2str(P(1,:)) ',' num2str(pi) ')']);
text(P(1,:), pi,msg);

% %%%%%%%%%%%%%%%%%%%
% pi_line_x = [lum.x0(1,1) lum.x0(1,length(lum.x0))];
% pi_line_y = ones(1,2)*pi;
% 
% P = InterX([pi_line_x;pi_line_y],[lum.x0;lum.y0]);
% 
% plot(lum.x0, lum.y0, P(1,:), pi, 'ro');
% title('2 heaters at 45 angle');
% set(get(ax1, 'XLabel'), 'String', 'power [W]');
% set(get(ax1, 'XLabel'), 'FontSize', 16);
% set(get(ax1, 'XLabel'), 'FontWeight', 'bold');
% set(get(ax1, 'YLabel'), 'String', 'phase [rad]');
% set(get(ax1, 'YLabel'), 'FontSize', 16);
% set(get(ax1, 'YLabel'), 'FontWeight', 'bold');
% set(ax1, 'XLim', [0 0.03]);
% set(ax1, 'YLim', [0 7]);
% set(ax1,'XGrid', 'on');
% set(ax1,'YGrid', 'on');
% line(pi_line_x, pi_line_y, 'Color', 'r', 'LineStyle', '-.');
% 
% msg = sprintf(['\n(' num2str(P(1,:)) ',' num2str(pi) ')']);
% text(P(1,:), pi,msg);