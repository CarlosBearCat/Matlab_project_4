%%Carlos Luevanos 
%%Project 4 - mathematics

clear all, close all, clc;

%Display a welcome message together with difficulty levels 
fprintf('Welcome to the treasure hunting game! \n');
%%1. Level difficulty 
% Decide range
dificulty = true;

while dificulty  %check if user input is 1,2, or 3
    level = input('Please choose a difficulty level: 1 - 10 x 10 grid, 2 - 50x50 grid, 3 - 100x100 grid: \n','s');
    level = str2num(level);
if level == 1 
    locx = 10;
    locy = 10;
    break
elseif level == 2 
    locx = 50;
    locy = 50;
    break
elseif level == 3 
    locx = 100;
    locy = 100;
    break
    elseif (level > 3 | level < 1)
         disp('That is not valid input. Please enter 1, 2, or 3.');  
end
end 

%%2. Display information
% Generate the target 
LocationX = randi(locx); % x coordinate

LocationY = randi(locy); %y coordinate

% Ask user to start guessing 
guessA = [];
guessB = [];
message = ('Location x:');
A = input(message);
guessA = [guessA A];
message = ('Location y:');
B = input(message);
guessB = [guessB B];

counter = 1;%for storing guesses
while A ~= LocationX || B ~= LocationY
    if A > LocationX
        fprintf('Move x left! \n')
    elseif A < LocationX
       fprintf('Move x right! \n') 
    end 
    if B > LocationY
        fprintf('Move y down! \n')        
    elseif B < LocationY       
fprintf('Move y up! \n')
    end   
    if A ~= LocationX
    message = ('Please input the location x:');
     A = input(message);
    guessA = [guessA A];
    end
    
    if B ~= LocationY
     message = ('Please input the location y:');
    B = input(message);
    guessB = [guessB B];
    end
    counter = counter + 1;
end

   while (B > locy || B < 1)
  message = ('y is outside the range');
    B = input(message);
      end
      
       while (A > locx || A < 1)
  message = ('x is outside the range');
    A = input(message);
     end

if (length(guessA) ~= length(guessB))
    if (length(guessA) > length(guessB))
        for i = 1: (length(guessA)-length(guessB))
            temp = guessB(end);
            guessB = [guessB  temp];
        end
    else
        for i = 1: (length(guessB)-length(guessA))
            temp = guessA(end);
            guessA = [guessA temp];
        end
    end
end

plot(guessA, guessB);
title('Treasure Hunt','fontsize',15);
grid on
hold on 
plot(guessA(1),guessB(1),'ro','MarkerFaceColor','r');
plot(LocationX,LocationY,'ro','MarkerFaceColor','g');
fprintf('You got it after %d guesses \n', counter)
