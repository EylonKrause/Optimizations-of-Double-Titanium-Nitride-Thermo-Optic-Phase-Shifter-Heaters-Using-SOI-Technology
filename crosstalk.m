%% CROSSTALK 
% 0.5-3 um @30mW total power
clear; clc 

CT = zeros(1,5);
roomtemp = 300;

Xpassive = [324 323 319 318 317.5];
Xactive = [348 347 347 347 347];
for n = 1:5
    CT(1,n) = (Xpassive(1,n) - roomtemp)/(Xactive(1,n) - roomtemp);
end
fprintf("%6.3f\n",CT(1,:));