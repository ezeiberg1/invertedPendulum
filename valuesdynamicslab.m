J1= 0.0012;
L_2 = 0.3;
B2 = 0.002;
k_r = 70;
m2 = 0.127;
Lcr= 0.15;
R_a=2.6;
L_sum = 0.2;
B1=0.015;
k_t=0.00768;
k_v=0.00768;


theta1 = (J1+m2*(L_sum)^2)*(R_a)/(k_r*k_t);

theta2 = 1/3*m2*(L_2)^2*(R_a)/(k_r*k_t);

theta3 = (1/2*m2*(L_sum)*L_2)*(R_a)/(k_r*k_t);

theta4 = m2*Lcr*(R_a)/(k_r*k_t);

theta5 = B1*(R_a)/(k_r*k_t)+k_r*k_v;

theta6 = B2*(R_a)/(k_r*k_t);

thetas = [theta1; theta2; theta3; theta4; theta5; theta6];

thetas_calculated = [theta1 theta2 theta3 theta4 theta5 theta6].';

