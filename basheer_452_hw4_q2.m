g_0 = [0.71271,-.639929,.28729,.158154;
    .639929,.45254,-.639929,-1.02424;
    .28729,.639929,.71271,-2.55815;
    0, 0, 0, 1]

h = 0.7
q = [3; -2; -5]
w = [1; -1; 2]
omega = w / norm(w)
omega_hat = [0,-omega(3),omega(2);omega(3),0,-omega(1);-omega(2),omega(1),0]


syms t
theta = 3*t^2 + t

E = expm(omega_hat * theta)
twist_exp = [E, (eye(3) - E)*q + h* theta * omega; 0, 0, 0, 1]
g_ab = twist_exp * g_0