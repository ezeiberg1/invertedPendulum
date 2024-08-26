
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

thetaUserValue = getUserInputInRange(-pi, pi, "Theta");


animationPoints = firstL_points;
animationFrames = 30;
theta_increment = thetaUserValue/animationFrames;


%task 4
Link2_points= [0 0; 0 12; 0 0];

for i = 1:animationFrames
    animationPoints = TRANS01(animationPoints, theta_increment); %rotate by the theta increment and return the updated position
    plot3(animationPoints(1,:), animationPoints(2,:), animationPoints(3,:),'-o', 'linewidth', 2, 'markersize', 6);

    grid on;
    axis equal;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    xlim([-15, 15]);
    ylim([-15, 15]);
    zlim([-15, 15]);
    pause(1/animationFrames);
    hold off;
end

function [Points1] = TRANS01(Points,theta1)
    %transforms- convert points in Frame-1 to Frame-0
    [M,N] = size(Points);
    Temp = ones(4,N);
    Temp(1:3,:) = Points;
    Points = Temp;
    T01 = [cos(theta1) -sin(theta1) 0   0;
          sin(theta1) cos(theta1)  0   0;
          0               0                1   0;
          0               0                0   1];
    % Points= [0 0 0 0 0; 0 0 6 6 8; 0 -1 -1 0 0; 1 1 1 1 1];

    Points1 = T01*Points;
    Points1 = Points1(1:3,:);
end

function userInput = getUserInputInRange(lowerBound, upperBound, coordinateName)
    % the function is used to have the user input be in a specified range

    while true
        fprintf('Enter a %s value between %d and %d: ', coordinateName, lowerBound, upperBound);
        userInput = input('', 's');  
        % Converting the string to a numeric value
        userInput = str2double(userInput);

        % Check if the input is a valid number
        if ~isnan(userInput) && (isnan(lowerBound) || userInput >= lowerBound) && (isnan(upperBound) || userInput <= upperBound)
            break;  % Exit the loop if the input is valid
        else
            disp('Invalid input. Please enter a numeric value within the specified range.');
        end
    end
    x0 = [0 0];%frame 0 base frame
    y0 = [0 0];
    z0 = [-1 0];
    plot3(x0, y0, z0, '-o', 'linewidth', 2);
    grid on;
    hold on;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title(' Base of Robot and First Link');
    axis equal;
    % frame 1 points added to frame 0

    % %task 3
    % figure;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    xlim([-15, 15]);
    ylim([-15, 15]);
    zlim([-15, 15]);
    hold on;
    firstL_points= [0 0 0 0 0;... 
                0 0 6 6 8;...
                0 -1 -1 0 0];

    plot3(firstL_points(1,:), firstL_points(2,:), firstL_points(3,:),'-o', 'linewidth', 2, 'markersize', 6);
    hold on;
    Link2_points= [0 0; 0 12; 0 0];
    plot3(Link2_points (1,:), Link2_points(2,:), Link2_points(3,:),'-o', 'linewidth', 2, 'markersize', 6);
    hold off;

end