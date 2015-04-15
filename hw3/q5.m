g = [0.475729, -0.847819, -0.234274, 0.79169;
    0.775506, 0.529964, -0.343116, -0.661014;
    0.415057, -0.0184505, 0.909608, 0.0572566;
    0, 0, 0, 1]
R = g(1:3,1:3)
P = g(1:3,4)

theta = acos((trace(R) - 1) / 2)
omega = (1/(2*sin(theta))) * [R(3,2) - R(2,3); R(1,3) - R(3,1); R(2,1) - R(1,2)]
omega_hat = [0,-omega(3),omega(2);omega(3),0,-omega(1);-omega(2),omega(1),0]

v = inv((eye(3) - expm(omega_hat * theta)) * omega_hat + omega*transpose(omega)*theta) * P

q = cross(omega, v / theta)
h = dot(omega, v) / theta ^2