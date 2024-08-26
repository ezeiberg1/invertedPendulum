syms theta1 theta2 theta3 theta4 theta5 theta6 q1 q2 q1_d q2_d v1 grav

m = [theta1+theta2*(sin(q2))^2 theta3*cos(q2);
    theta3*cos(q2) theta2];
m_inv = m^(-1);
u = [v1; 0]; 
c = [2*theta2*q2_d*sin(q2)*cos(q2) -theta3*q2_d*sin(q2); 
    -theta2*q1_d*sin(q2)*cos(q2) 0];
f = [theta5*q1_d; theta6*q2_d];
g = [0; -theta4*grav*sin(q2)];
q = [q1_d; q2_d];

q_dd = simplify((m_inv)*(u-c*q-f-g));
q1_dd = q_dd(1); %f2
q2_dd = q_dd(2); %f4

%% 
%Partial derivitives of f2 (q1dd)
q1dd_q1 = diff(q1_dd,q1);
q1dd_q2 = diff(q1_dd,q2);
q1dd_q1d = diff(q1_dd,q1_d);
q1dd_q2d = diff(q1_dd,q2_d);
q1dd_v1 = diff(q1_dd,v1);

%Partial derivitives of f4 (q2dd)
q2dd_q1 = diff(q2_dd,q1);
q2dd_q2 = diff(q2_dd,q2);
q2dd_q1d = diff(q2_dd,q1_d);
q2dd_q2d = diff(q2_dd,q2_d);
q2dd_v1 = diff(q2_dd,v1);
%% 
%Partial derivitives of f2 evaluated at equailibrium
f2_q1 = subs(q1dd_q1, [q1, q1_d, q2, q2_d], [0, 0, 0, 0]);
f2_q2 = subs(q1dd_q2, [q1, q1_d, q2, q2_d], [0, 0, 0, 0]);
f2_q1d = subs(q1dd_q1d, [q1, q1_d, q2, q2_d], [0, 0, 0, 0]);
f2_q2d = subs(q1dd_q2d, [q1, q1_d, q2, q2_d], [0, 0, 0, 0]);
f2_v1 = subs(q1dd_v1, [q1, q1_d, q2, q2_d], [0, 0, 0, 0]);

%Partial derivitives of f4 evaluated at equailibrium
f4_q1 = subs(q2dd_q1, [q1, q1_d, q2, q2_d], [0, 0, 0, 0]);
f4_q2 = subs(q2dd_q2, [q1, q1_d, q2, q2_d], [0, 0, 0, 0]);
f4_q1d = subs(q2dd_q1d, [q1, q1_d, q2, q2_d], [0, 0, 0, 0]);
f4_q2d = subs(q2dd_q2d, [q1, q1_d, q2, q2_d], [0, 0, 0, 0]);
f4_v1 = subs(q2dd_v1, [q1, q1_d, q2, q2_d], [0, 0, 0, 0]);
%% 
A = [0 1 0 0;
    f2_q1 f2_q1d f2_q2 f2_q2d;
    0 0 0 1;
    f4_q1 f4_q2 f4_q1d f4_q2d];

B = [0 0; f2_v1 0; 0 0; f4_v1 0];







