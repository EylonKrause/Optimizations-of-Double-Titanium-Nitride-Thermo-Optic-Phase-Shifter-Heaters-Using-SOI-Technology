%% ATTENUATION INDEX

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


%Variables:
m=0; 
lambda = 1550e-9; %[m]
alpha = zeros(1,4); %attenuation variable
d = 0.5:0.5:2; %CM2WG variable
distances = [" @ $0.5 \mu m$";" @ $1 \mu m$";" @ $1.5 \mu m$";" @ $2 \mu m$"];
temp = cell(1,4);

%Attenuation @ P_pi = 30mW:
for n = 1:4
	alpha(1,n) = 4*pi*set_plot{n}.lum.y1(1,length(set_plot{n}.lum.y1))/lambda; %Complex refractive coefficient to attenuation index [1/m]
	alpha(1,n) = abs(alpha(1,n)*4.434*1e-3); %Normalization from [1/m] to [dB/mm]
end       

%YLog plot:
semilogy(d, alpha,'LineWidth',3,'Color','k');  

%Dot plot:
newcolors = [0.83 0.14 0.14;
             1.00 0.54 0.00;
             0.47 0.25 0.80;
             0.25 0.80 0.54];

hold on;
set(gca,'FontSize',30);

for n = 1:4
	plot(d(1,n), alpha(1,n),'o','LineWidth',10,'Color',newcolors(n,:));
    fprintf("\n%d\n",alpha(1,n));
    
    while fix(alpha(1,n)) < 1
        alpha(1,n) = 10*alpha(1,n);
        m = m + 1;
    end  
    temp{1,n} = [num2str(round(alpha(1,n),2)) + "e-0" + num2str(m)+ " $dB/mm$" + distances(n,:)];
    m = 0;
end
hold off;



grid on;
ylabel("$\alpha$ ($dB/mm$)", 'FontSize', 30,'Interpreter','latex','Color','k'); %,'FontWeight', 'bold'
xlabel('d ($\mu m$)', 'FontSize', 30,'Interpreter','latex'); 
x = legend(['' temp{1,:}],'Location','NorthEast','FontSize',30,'Interpreter','latex');
title(x,'Attenuation at distance','Interpreter','latex')

% v_pi(cross(1,:));

if isfile('barchart.tif')
    delete 'barchart.tif'
end
exportgraphics(gca,'barchart.tif','Resolution',1080)