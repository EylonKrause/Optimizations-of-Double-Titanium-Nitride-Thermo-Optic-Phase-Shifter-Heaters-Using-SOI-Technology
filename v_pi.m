function [] = v_pi(power_pi)
    row = power(2.3e+06,-1);
    Lz = 1000e-06;
    Area = 2e-06*0.22e-06;
    Area = Area*2;
    fprintf("%6.3f V\n",round(sqrt(1e-03*power_pi*row*Lz/Area),3));
    
%     clear row Lz Area power_pi
end