
clc;
clear all;
close all;
figure();

x0 = [0 0];%frame 0 base frame
y0 = [0 0];
z0 = [-1 0];


firstL_points= [0 0 0 0 0;... 
                0 0 6 6 8;...
                0 -1 -1 0 0];

theta1 = getUserInputInRange(0, 2*pi, "Theta1");
theta2 = getUserInputInRange(0, pi, "Theta2");
Link2_points= [0 0; 0 12; 0 0];

animationPoints1_fixed = firstL_points;
animationPoints2_fixed = Link2_points;

animationFrames = 60;
theta1_increment = theta1/animationFrames;
theta2_increment = theta2/animationFrames;

theta1_vals = [0: theta1_increment: theta1]
theta2_vals = [0: theta2_increment: theta2]

% task 1

% task 2
m = []
% task 3
    % J1 = 0.0012;
    % I2 = 0.3;
    % Beta2 = 0.002;
    % k_r = 70;
    % m2 = 0.127;
    % I_c2 = 0.15;
    % Ra = 2.6;
    % I1+I2= 0.2;
    % Beta1 = 0.015;
    % kt = kv = 0.00768;
for i = 1:length(theta1_vals)
    for j = 1:length(theta2_vals)
        x0 = [0 0];%frame 0 base frame
        y0 = [0 0];
        z0 = [-10 0];
        plot3(x0, y0, z0, '-o', 'linewidth', 2);
        grid on;
        hold on;
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
        xlim([-15, 15]);
        ylim([-15, 15]);
        zlim([-15, 15]);
        %axis equal;
        

       
        animationPoints1 = TRANS01(animationPoints1_fixed, theta1_vals(i));
        plot3(animationPoints1(1,1:4), animationPoints1(2,1:4), animationPoints1(3,1:4),'-o', 'linewidth', 2, 'markersize', 6, 'Color', 'b');
        plot3(animationPoints1(1,5), animationPoints1(2,5), animationPoints1(3,5),'-o', 'linewidth', 2, 'markersize', 3, 'Color', 'magenta');
        
        animationPoints2 = TRANS02(animationPoints2_fixed, theta1_vals(i), theta2_vals(j));
        plot3(animationPoints2(1,1), animationPoints2(2,1), animationPoints2(3,1),'-o', 'linewidth', 2, 'markersize', 6, 'Color', 'b');
        plot3(animationPoints2(1,2), animationPoints2(2,2), animationPoints2(3,2),'-o', 'linewidth', 2, 'markersize', 3, 'Color', 'magenta');

        %pause(1/animationFrames);
        %hold off;

    end

end
