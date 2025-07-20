%%P_pi sensitivity to wavelength
clear; clc

path = "C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\WG";
lambda = 1530:5:1570;
len = length(lambda);
file_path = cell(1,len);
file = cell(1,len);
temp = zeros(2,3,len);
temp_pi = zeros(2,len);
pi_line = pi*ones(1,3);

figure(1);
for n = 1:len
    file_path{1,n} = path + "\" + num2str(lambda(1,n)) + ".mat";
    file{1,n} = load(file_path{1,n}).lum;
    temp(1,:,n) = file{1,n}.x0;
    temp(2,:,n) = file{1,n}.y0;
    temp_pi(:,n) = InterX([temp(1,:,n);temp(2,:,n)],[temp(1,:,n);pi_line])';
end    

plot(lambda,temp_pi(1,:)*10^3,'LineWidth',3);
set(gca,'FontSize',30);
xlim([lambda(1,1) lambda(1,len)]);
ylim([temp_pi(1,1)*10^3 temp_pi(1,len)*10^3]);
xlabel('$\lambda$ ($nm$)', 'FontSize', 30,'Interpreter','latex');
ylabel("P${\pi}$ ($mW$)", 'FontSize', 30,'Interpreter','latex'); %,'FontWeight', 'bold'
grid on;