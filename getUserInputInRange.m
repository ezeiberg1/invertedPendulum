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
    

end