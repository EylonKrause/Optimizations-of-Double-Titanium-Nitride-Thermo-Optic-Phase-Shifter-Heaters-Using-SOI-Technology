%% 

close all;
clear; clc

%Load files: 
% set_plot{1} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\0.5um\half_um.mat");
set_plot{1} = load("05.mat");
set_plot{2} = load("1.mat");
set_plot{3} = load("15.mat");
set_plot{4} = load("2.mat");


% set_plot{1} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\05.mat");
% set_plot{2} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\1.mat");
% set_plot{3} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\15.mat");
% set_plot{4} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\2.mat");

cross = zeros(1,4);
temp = cell(1,4);
distances = [" @ $0.5 \mu m$";" @ $0.75 \mu m$";" @ $1 \mu m$";" @ $2 \mu m$";" @ $3 \mu m$"];

%Plot: 
ax1 = axes;
point = zeros(1,length(set_plot));

figure('units','normalized','outerposition',[0 0 1 1]);
%LINE PLOT
pi_line_x = 10e2*[set_plot{1}.lum.x0(1,1) set_plot{1}.lum.x0(1,length(set_plot{1}.lum.x0))];
pi_line_y = ones(1,2)*pi;

% ima_ref_line_x = [set_plot{1}.lum.x1(1,1) set_plot{1}.lum.x1(1,length(set_plot{1}.lum.x0))];
% ima_ref_line_x =

P = 10e2*InterX([pi_line_x;pi_line_y],[set_plot{1}.lum.x0;set_plot{1}.lum.y0]);
line(pi_line_x, pi_line_y, 'Color', 'k', 'LineStyle', '-.','LineWidth',3);
hold on;
grid on; 
set(gca,'FontSize',30);

newcolors = [0.83 0.14 0.14
             1.00 0.54 0.00
             0.47 0.25 0.80
             0.25 0.80 0.54];
         
colororder(newcolors)

for n = 1:length(set_plot)

    pi_line_x = 10e2*[set_plot{n}.lum.x0(1,1) set_plot{n}.lum.x0(1,length(set_plot{n}.lum.x0))];

    P = 10e2*InterX([pi_line_x;pi_line_y],[set_plot{n}.lum.x0;set_plot{n}.lum.y0]);
    cross(1,n) = P(1,1);
    point(1, n) = plot(10e2.*set_plot{n}.lum.x0, set_plot{n}.lum.y0,'LineWidth',3);

%     plot(P(1,:), pi, 'ro','LineWidth',3);
%     plot(set_plot{n}.lum.x1, log10(abs(set_plot{n}.lum.y1)))
end 
for n = 1:length(set_plot)
    P = 10e2*InterX([pi_line_x;pi_line_y],[set_plot{n}.lum.x0;set_plot{n}.lum.y0]);
    plot(P(1,:), pi, 'ro','LineWidth',3);
end
% yyaxis left
xlabel('Power (mW)', 'FontSize', 30,'Interpreter','latex');
ylabel("Phase shift (rad)", 'FontSize', 30,'Interpreter','latex'); %,'FontWeight', 'bold'
xlim([18 20]);
yticks(linspace(0,1.5*pi,4));
ylim([0.9*pi 1.1*pi]);
yticklabels({'0','0.5\pi','\pi','1.5\pi'});

% % get the current tick labeks
% ticklabels = get(gca,'YTickLabel');
% % prepend a color for each tick label
% ticklabels_new = cell(size(ticklabels));
% for i = 1:length(ticklabels)
%     ticklabels_new{i} = ['\color{black} ' ticklabels{i}];
% end
% % set the tick labels
% set(gca, 'YTickLabel', ticklabels_new);

cross(1,:) = round(cross(1,:),2);
%LEGEND
for n = 1:4
    temp{1,n} = [num2str(cross(1,n))+"mW"+distances(n,:)];
end    
leg = legend([point(1,1:n)], temp{1,:}, 'Location','SouthEast','FontSize',30,'Interpreter','latex');
title(leg,'P${\pi}$','Interpreter','latex')

hold off;
close(1);

figure(8)
% hold on;

newcolors = [0.83 0.14 0.14
             1.00 0.54 0.00
             0.47 0.25 0.80
             0.25 0.80 0.54];
         
colororder(newcolors)

lambda = 1550e-9; %nm
% lambda = 1.55pa; %um
% atten = zeros(1,4);
set(gca,'FontSize',30);
for n = 1:4
	alpha = 4*pi*set_plot{n}.lum.y1/lambda; %Complex refractive coefficient to attenuation index [1/m]
	alpha = alpha*4.434*1e-3; %Normalization from [1/m] to [dB/mm]
       
	semilogy(1e3*set_plot{n}.lum.x1, alpha,'LineWidth',3);
%        fprintf("%d %d %d %d\n",alpha);
%        fprintf("\n%d %d %d %d\n",atten);
    grid on;
end
ylabel("Attenuation index ($dB/mm$)", 'FontSize', 30,'Interpreter','latex','Color','k'); %,'FontWeight', 'bold'
xlabel('Power (mW)', 'FontSize', 30,'Interpreter','latex');
xlim([1e3*set_plot{n}.lum.x1(1,2) 1e3*set_plot{n}.lum.x1(1,3)]);

for n = 1:4
    temp{1,n} = distances(n,:);
end 

x = legend(temp{1,:},'Location','SouthWest','FontSize',30,'Interpreter','latex');
title(x,'CM-WG distance','Interpreter','latex')
% hold off;

% v_pi(cross(1,:));
% 
% if isfile('barchart.tif')
%     delete 'barchart.tif'
% end
% exportgraphics(gca,'barchart.tif','Resolution',1080)