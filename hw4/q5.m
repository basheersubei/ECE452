 
% Part A
V_ab_s = [1; -3; -2; 2; 1; -1]
v_ab_s = V_ab_s(1:3)
omega_ab_s = V_ab_s(4:6)
V_bc_b = [3; -5; -4; 2; -1; 4]
v_bc_b = V_bc_b(1:3)
omega_bc_b = V_bc_b(4:6)

% g_ab = ???
% g_bc = ???
g_ac = g_ab * g_bc

% Part B
V_ac_b = inv(g_ac) * diff(g_ac)

% Part C
V_ac_s = diff(g_ac) * inv(g_ac)