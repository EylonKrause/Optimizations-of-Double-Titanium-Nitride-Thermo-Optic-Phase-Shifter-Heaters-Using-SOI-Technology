%% ATTENUATION LENGTH

close all;
clear; clc

%Load files: 
set_plot{1} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\05.mat");
set_plot{2} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\1.mat");
set_plot{3} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\15.mat");
set_plot{4} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\2.mat");

%Variables:
m=0;
lambda = 1550e-9; %[m]
alpha = zeros(1,4); %attenuation variable
Lz = 0.5:0.5:2; %Length variable
distances = [" @ $0.5 mm$";" @ $1 mm$";" @ $1.5 mm$";" @ $2 mm$"];
temp = cell(1,4);

%Attenuation @ P_pi = 30mW:
temp1 = 4*pi*set_plot{4}.lum.y1(1,length(set_plot{4}.lum.y1))/lambda; %Complex refractive coefficient to attenuation index [1/m]
temp1 = abs(temp1*4.434*1e-3); %Normalization from [1/m] to [dB]

for n = 1:4
    alpha(1,n) = Lz(1,n)*temp1; 
end 

plot(Lz, alpha,'LineWidth',3);
hold on;
set(gca,'FontSize',30);
plot(Lz, alpha,'ro','LineWidth',3);
grid on;
ylabel("$Attenuation$ ($dB$)", 'FontSize', 30,'Interpreter','latex','Color','k'); %,'FontWeight', 'bold'
xlabel('$L{z} (mm)$', 'FontSize', 30,'Interpreter','latex'); 
q =alpha(1,2);
while fix(alpha(1,2)) < 1
    alpha(1,2) = 10*alpha(1,2);
    m = m + 1;
end  
text(0.95*Lz(1,2),q,["";"";"("+num2str(Lz(1,2))+","+num2str(round(alpha(1,2),2))+"e-0"+num2str(m)+")"],'FontSize',30);
hold off;