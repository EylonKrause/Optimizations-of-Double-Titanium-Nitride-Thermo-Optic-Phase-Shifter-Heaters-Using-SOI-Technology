%% DIMENSIONAL PLOT 

close all;
clear; clc;

%LOAD TEMPERATURE LOCATION: 
photo = imread(["C:\Users\Eylon\Documents\Lumerical\Heater_center_distance\MODE.jpg"]);
% photo = photo(:,:,1:3);
[l w d] = size(photo);
% photo = reshape(photo,l,w*d);


figure(1);
yyaxis right
imagesc(photo);
set(gca, 'XTick', [], 'XTickLabel', [],'FontSize',30);
set(gca, 'YTick',linspace(1,l,11),'YTickLabel', 1:-0.1:0,'FontSize',30);
set(gca,'ycolor','k');
ylabel(["Normalized light confinement (a.u)"],'FontSize',30,'Interpreter','latex');
yyaxis left
set(gca, 'YTick',[],'YTickLabel', [],'FontSize',30);

% exportgraphics(gca,["MODE1.TIF"],'Resolution',1080);