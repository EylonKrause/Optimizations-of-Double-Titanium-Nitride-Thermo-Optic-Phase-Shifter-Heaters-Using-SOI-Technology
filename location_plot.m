%%

close all;
clear; clc

%Load files: 
% set_plot{1} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\0.5um\half_um.mat");
set_plot{1} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\0.5um\test.mat");
set_plot{2} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\0.75um\test.mat");
set_plot{3} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\1um\test.mat");
set_plot{4} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\2um\test.mat");
set_plot{5} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\3um\test.mat");


cross = zeros(1,5);
temp = cell(1,5);
distances = [" @ $0.5 \mu m$";" @ $0.75 \mu m$";" @ $1 \mu m$";" @ $2 \mu m$";" @ $3 \mu m$"];

%Plot: 
ax1 = axes;
space = "";
angle = 0;
point = [];

figure('units','normalized','outerposition',[0 0 1 1]);
%LINE PLOT
pi_line_x = 10e2*[set_plot{1}.lum.x0(1,1) set_plot{1}.lum.x0(1,length(set_plot{1}.lum.x0))];
pi_line_y = ones(1,2)*pi;

P = 10e2*InterX([pi_line_x;pi_line_y],[set_plot{1}.lum.x0;set_plot{1}.lum.y0]);
line(pi_line_x, pi_line_y, 'Color', 'k', 'LineStyle', '-.','LineWidth',3);
hold on;
grid on; 
set(gca,'FontSize',30);
for n = 1:length(set_plot)
    space = append(space,"\n\n");

    pi_line_x = 10e2*[set_plot{n}.lum.x0(1,1) set_plot{n}.lum.x0(1,length(set_plot{n}.lum.x0))];
    pi_line_y = ones(1,2)*pi;

    P = 10e2*InterX([pi_line_x;pi_line_y],[set_plot{n}.lum.x0;set_plot{n}.lum.y0]);
    cross(1,n) = P(1,1);
    point(1, n) = plot(10e2.*set_plot{n}.lum.x0, set_plot{n}.lum.y0,'LineWidth',3);

    plot(P(1,:), pi, 'ro','LineWidth',3);
end 

% title('phase shift as a function of power','at different distances between the heaters','FontSize',20);
xlabel('Power (mW)', 'FontSize', 30,'Interpreter','latex');
ylabel("Phase shift (rad)", 'FontSize', 30,'Interpreter','latex'); %,'FontWeight', 'bold'
xlim([0 25]);
yticks(linspace(0,1.5*pi,4));
yticklabels({'0','0.5\pi','\pi','1.5\pi'});
    
cross(1,:) = round(cross(1,:),2);

%LEGEND
for n = 1:5
    temp{1,n} = [num2str(cross(1,n))+"mW"+distances(n,:)];
end    
leg = legend([point(1,1:n)], temp{1,:}, 'Location','SouthEast','FontSize',30,'Interpreter','latex');
title(leg,'P${\pi}$','Interpreter','latex')

hold off;
close(1);

v_pi(cross(1,:));

% if isfile('barchart.tif')
%     delete 'barchart.tif'
% end
exportgraphics(gca,'barchart.tif','Resolution',1080)