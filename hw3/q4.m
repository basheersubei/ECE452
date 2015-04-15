theta = sym('x');

g = [(1/25)*(16*cos(x)+9), -(4*sin(x)/5), (12/25)*(cos(x)-1), (1/25)*(-30*x+8*cos(x)+20*sin(x)-8);

    (4*sin(x)/5), cos(x), (3/5)*sin(x), -cos(x) + (2/5)*sin(x) + 1;

    (12/25)*(cos(x)-1), (-3/5)*sin(x), (1/25)*(9*cos(x) + 16), (1/25)*(40*x+6*cos(x)+15*sin(x) -6);

    0, 0, 0, 1]

 

R = g(1:3, 1:3)

 

P = g(1:3, 4)

 
% theta = acos((trace(R) - 1) / 2)
omega = (1/(2*sin(theta))) * [R(3,2) - R(2,3); R(1,3) - R(3,1); R(2,1) - R(1,2)]
omega_hat = [0,-omega(3),omega(2);omega(3),0,-omega(1);-omega(2),omega(1),0]

v = simplify(inv((eye(3) - expm(omega_hat * theta)) * omega_hat + omega*transpose(omega)*theta) * P)

q = simplify(cross(omega, v / theta))
h = simplify(dot(omega, v) / theta ^2)
