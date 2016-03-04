% Byron Becker
% Homework 5
% Problem # 3c - Magic Square
% 3-28-15

% This function takes both prev functions and displays an output if the
% matrix is a magic square

function output = test_magic_square(Input_matrix)
[rows,columns] = size(Input_matrix);
Magic = 0; % New function that defines the indication if the function is successful or not
Msquare = 0;
Goody = 0;
bad_matrix = 0;
Right_Diagonal = 0;
Left_Diagonal = 0;
Last_row = length(Input_matrix) + 1;
First_column = 0;
for r = 1:rows;
    for c = 1:columns;
        if r == c
            Right_Diagonal = Right_Diagonal + Input_matrix(r,c);
        end
    end
    Last_row = Last_row - 1;
    First_column = First_column + 1;
    Left_Diagonal = Left_Diagonal + Input_matrix(Last_row,First_column);
end
Msquare = Msquare + Right_Diagonal;
for r = 1:rows;
    for c = 1:columns;
    if Msquare ~= sum(Input_matrix(r,:)) || Msquare ~= sum(Input_matrix(:,c)) || Msquare ~= Right_Diagonal || Msquare ~= Left_Diagonal;
        Magic = Magic + 1;
        end
    end
end
if Magic ~= 0;
    Goody = Goody
else
    Goody = Goody + 1
end


Previous_value = 0;
Badness = 0;
Good_matrix = 0;
Ordered_matrix = sort(reshape(Input_matrix,[1,numel(Input_matrix)]));
Newc = columns - 1;
for c = 1:Newc;
    for n = c + 1
        if Ordered_matrix(c) == Ordered_matrix(n)
            Badness = Badness + 50;
        end
    end
end
if Badness ~= 0
    Good_matrix = 0
else
    Good_matrix = 1
end

if Good_matrix == 1 && Goody == 1
    display(1)
else
    display(0)
end
