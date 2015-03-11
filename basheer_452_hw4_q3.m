w = [-4; 1; 3]
omega_ab_s = w / norm(w)
omega_ab_s_hat = [0,-omega_ab_s(3),omega_ab_s(2);omega_ab_s(3),0,-omega_ab_s(1);-omega_ab_s(2),omega_ab_s(1),0]

syms t
p_ab = [3*t^2 * cos(t) - 2*t * sin(t);t^2 * sin(t) - cos(t); -2*t^2 * cos(t) + 3 * t * sin(t) * cos(t) + 1]
p_ab_dot = diff(p_ab)
V_abs = [omega_ab_s_hat*p_ab + p_ab_dot;omega_ab_s]

% Part A done

R = vpa(simplify(expm( omega_ab_s_hat * t)), 4)
omega_ab_b = R' * omega_ab_s
V_ab_b = [R' * p_ab_dot ;omega_ab_b]

% Part B done
R_ab_1 = vpa(subs(R, t, 1),2)
p_ab_1 = subs(p_ab, t, 1)