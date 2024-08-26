%start at upright position with no velocity
q1 = 0; 
q2 = 0;
q1_d = 0;
q2_d = 0;

X = [q1, q2, q1_d, q2_d];

theta1 = (J1+m2*(L1+L2_prime)^2)*(R_a)/(k_r*k_t);
theta2 = 1/3*m2*(L_2)^2*(R_a)/(k_r*k_t);
theta3 = (1/2*m2*(L1+L2_prime)*L2)*(R_a)/(k_r*k_t);
theta4 = m2*L_c2*(R_a)/(k_r*k_t);
theta5 = B1*(R_a)/(k_r*k_t)+k_r*k_v;
theta6 = B2*(R_a)/(k_r*k_t);


m = [theta1+theta2*(sin(q2))^2 theta3*cos(q2);
    theta3*cos(q2) theta2];
m_inv = m^(-1);
v = [0, 0]; %no voltage
c = [2*theta2*q2_d*sin(q2)*cos(q2) -theta3*d2_d*sin(q2); 
    -theta2*q1_d*sin(q2)*cos(q2) 0];
f = [theta5*q1_d; theta6*q2_d];
g = [0; -theta4*grav*sin(q2)];

q1_dd = m_inv(1, :)*(v(1)-f(1)-g(1)-c(1,:)*q1_d);
q2_dd = m_inv(2, :)*(v(2)-f(2)-g(2)-c(2,:)*q2_d);
X_d = [q1_d, q2_d, q1_dd, q2_dd];

 
