function [Points2] = TRANS02(Points,theta1, theta2)

    T01 = [cos(theta1) -sin(theta1) 0   0;
              sin(theta1) cos(theta1)  0   0;
              0               0                1   0;
              0               0                0   1];
    
    l1 = 6;
    l2 = 2;
    
    T12 = [cos(theta2) -sin(theta2) 0 0;
               0 0 -1 (l1+l2);
               sin(theta2) cos(theta2) 0 0;
               0 0 0 1];
    %transforms- convert points in Frame-2 to Frame-0
    [M,N] = size(Points);
    Temp = ones(4,N);
    Temp(1:3,:) = Points;
    Points = Temp;
   

    Points2 = T01*T12*Points;
    Points2 = Points2(1:3,:);
end