%% THERMAL CROSSTALK
clear; clc

x = [0.5 0.75 1 2 3];
y = [0.5 0.489 0.404 0.383 0.372];
temp_line_x = ones(1,3);
temp_line_y = 0:0.25:0.5;
temp =InterX([x;y],[temp_line_x;temp_line_y]);

plot(x,y,'LineWidth',3);
hold on;
text(0.9*temp(1,1),temp(2,1),["";"";"("+num2str(temp(1,1))+","+num2str(temp(2,1))+")"],'FontSize',30);
plot(x,y,'ro','LineWidth',3);
xlabel("Heaters Distance ($\mu m$)","Interpreter","latex");
ylabel("Thermal crosstalk","Interpreter","latex");
ylim([0.3 0.55]);
set(gca, 'XTick', x, 'XTickLabel', x,'FontSize',30);
grid on;
% legend(y);
% leg = legend('Location','NorthEast','FontSize',30,'Interpreter','latex');
% title(leg,'Thermal CT','Interpreter','latex')
hold off;