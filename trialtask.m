
clc;
clear all;
close all;
%task 1
x0 = [0 0];%frame 0 base frame
y0 = [0 0];
z0 = [-1 0];


%task 2 
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
% for i = 1:animationFrames
%     animationPoints = TRANS01(animationPoints, theta_increment); %rotate by the theta increment and return the updated position
%     plot3(animationPoints(1,:), animationPoints(2,:), animationPoints(3,:),'-o', 'linewidth', 2, 'markersize', 6);
% 
%     grid on;
%     axis equal;
%     xlabel('X');
%     ylabel('Y');
%     zlabel('Z');
%     xlim([-15, 15]);
%     ylim([-15, 15]);
%     zlim([-15, 15]);
%     pause(1/animationFrames);
%     hold off;
% end

% function [Points1] = TRANS01(Points,theta1)
%     %transforms- convert points in Frame-1 to Frame-0
%     [M,N] = size(Points);
%     Temp = ones(4,N);
%     Temp(1:3,:) = Points;
%     Points = Temp;
%     T01 = [cos(theta1) -sin(theta1) 0   0;
%           sin(theta1) cos(theta1)  0   0;
%           0               0                1   0;
%           0               0                0   1];
%     % Points= [0 0 0 0 0; 0 0 6 6 8; 0 -1 -1 0 0; 1 1 1 1 1];
% 
%     Points1 = T01*Points;
%     Points1 = Points1(1:3,:);
% end
% 
% function [Points2] = TRANS02(Points,theta2)
%     %transforms- convert points in Frame-2 to Frame-0
%     [M,N] = size(Points);
%     Temp = ones(4,N);
%     Temp(1:3,:) = Points;
%     Points = Temp;
%     T01 = [cos(theta1) -sin(theta1) 0   0;
%           sin(theta1) cos(theta1)  0   0;
%           0               0                1   0;
%           0               0                0   1];
%     l1 = 6;
%     l2 = 2;
%     T12 = [cos(theta2) -sin(theta2) 0 0;
%            0 0 -1 (l1+l2);
%            sin(theta2) cos(theta2) 0 0;
%            0 0 0 1];
% 
% 
%     Points2 = T12*T01*Points;
%     Points2 = Points2(1:3,:);
% end

% function userInput = getUserInputInRange(lowerBound, upperBound, coordinateName)
%     % the function is used to have the user input be in a specified range
% 
%     while true
%         fprintf('Enter a %s value between %d and %d: ', coordinateName, lowerBound, upperBound);
%         userInput = input('', 's');  
%         % Converting the string to a numeric value
%         userInput = str2double(userInput);
% 
%         % Check if the input is a valid number
%         if ~isnan(userInput) && (isnan(lowerBound) || userInput >= lowerBound) && (isnan(upperBound) || userInput <= upperBound)
%             break;  % Exit the loop if the input is valid
%         else
%             disp('Invalid input. Please enter a numeric value within the specified range.');
%         end
%     end
% 
% 
% end