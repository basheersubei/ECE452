% Part A
g_0 = [0.71271,-.639929,.28729,.158154;
    .639929,.45254,-.639929,-1.02424;
    .28729,.639929,.71271,-2.55815;
    0, 0, 0, 1]

h = 0.7
q = [3; -2; -5]
w = [1; -1; 2]
omega = w / norm(w)
omega_hat = [0,-omega(3),omega(2);omega(3),0,-omega(1);-omega(2),omega(1),0]


syms t;
theta = 3*t^2 + t
theta_dot = diff(theta)
% R = expm(simplify(omega_hat * theta))
% p = simplify((eye(3) - R)*q + h* theta * omega)

twist_hat = [omega_hat, cross(-omega, q) + h*omega;
            0, 0, 0, 1]
twist_exp = simplify(expm(twist_hat * theta))
% twist_exp = [R, p; 0, 0, 0, 1]
g_ab = vpa(simplify(twist_exp * g_0),4)
% Part B
v = (-1 * cross(omega,q)) + (h * omega)
twist = [v; omega]
g_ab_dot = diff(g_ab)
g_ab_inv = inv(g_ab)
V_ab_b_hat = g_ab_inv * g_ab_dot
V_ab_b_hat = vpa(simplify(V_ab_b_hat, 4))

V_ab_b = [V_ab_b_hat(1:3,4); -V_ab_b_hat(2,3); V_ab_b_hat(1,3); -V_ab_b_hat(1,2)]

% R_T = transpose(R)
% p_hat = [0, -p(3), p(2);p(3), 0, -p(1);-p(2), p(1), 0]
% ad_g_inv = [R_T, -1*R_T * p_hat ; zeros(3,3), R_T]
% V_ab_b = ad_g_inv * twist * theta_dot
% Part C

V_ab_s = twist * theta_dot