% Byron Becker
% Homework 5
% Problem # 4 - Linear Equation Solver
% 3-28-15

% This function solves a system of linear equations, and evaluates if there
% is a solution while solving it as well
function output = linear_equation_solver(A,B)
[rows1,columns1] = size(A);
[rows2,columns2] = size(B);
X = zeros(length(A),1) % sets up X base on the A matrix
was_solved = 0;

if rows1 == rows2 && columns2 == 1 && det(A) ~= 0 % conditions for matrix solvable
    was_solved = was_solved + 1;
else
    was_solved = was_solved;
end

if was_solved == 1
    X = X + inv(A) * B; % if solvable, solves for the inverse
end
display(X)
display(was_solved)
end

    


