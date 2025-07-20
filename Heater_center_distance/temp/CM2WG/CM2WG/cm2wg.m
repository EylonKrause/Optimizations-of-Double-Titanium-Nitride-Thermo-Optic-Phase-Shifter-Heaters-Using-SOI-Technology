%% DIMENSIONAL PLOT 

close all;
clear; clc;

%LOAD TEMPERATURE LOCATION: 
set_plot{1} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\05T.mat");
set_plot{2} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\1T.mat");
set_plot{3} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\15T.mat");
set_plot{4} = load("C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\temp\2T.mat");

%X-Y AXIS POINTS:
xpoints = -4:4;
xlength = length(xpoints);
ypoints = 1.5:-0.5:-2;
ylength = length(ypoints);

%TEMPERATURE MATRIX:
temp = zeros(4);
for n = 1:length(set_plot)
    temp(:,n) = fix(linspace(round(max(set_plot{n}.T.T(:,:,1,2))),round(max(set_plot{n}.T.T(:,:,1,1))),4));
end

for n = 1:length(temp)
    photos = imread(["Slide"+num2str(n)+".TIF"]);
    [l w d] = size(photos);
    
    figure(n);
	yyaxis left
    imagesc(photos);
    xlabel([' \boldmath$x (\mu m)$'],'FontSize',30,'Interpreter','latex');
	set(gca, 'XTick', linspace(1,w,xlength), 'XTickLabel', [xpoints],'FontSize',30);
    ylabel([' \boldmath$y (\mu m)$'],'FontSize',30,'Interpreter','latex');
    set(gca, 'YTick', linspace(1,l,ylength), 'YTickLabel', [ypoints],'FontSize',30);
    set(gca,'ycolor','k');
	yyaxis right
    imagesc(photos);
    set(gca, 'YTick', linspace(1,l*0.9,length(temp)+1),'YTickLabel', [temp(:,n);"T[K]"],'FontSize',30);
    set(gca,'ycolor','k');
    
    exportgraphics(gca,["Photo"+num2str(n)+".TIF"],'Resolution',1080)
end