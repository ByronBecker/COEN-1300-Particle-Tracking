% Byron Becker
% COEN Final Project - Particle Tracking
% Section 408
% 4-15-15

% This function creates a vector called number_in_region, that is 1 row by
% the number of time increments columns

% Instructions: Type Calc_conc(D,v,dt) where D is the diffusivity constant,
% v is the velocity, and dt is the time increment. 

% Interpretation: see the graph, which shows concentration(y-axis) as a 
% function of time(x-axis) to determine when the concentration of particles
% in the well region exceeds 10.
% For a numerical interpretation, view the output matrix by doubleclicking
% on answer in the workspace

function number_in_region = Calc_conc(D,v,dt)
% Dependent on D = Diffusivity Constant v = input velocity dt = time
% increments

time = [0:dt:0.5];
% creates a vector t that can be changed for different time increments

x0 = 0.01; 
y0 = 5;

% sets initial x and y values

interval = dt; 
% creates a variable later used in the final for loop for output indexing

output = zeros(2000,length(time));
% creates the initial zeroed out output matrix with a length dependent on
% the number of time intervals

output(1:1000,1) = x0;
output(1001:2000,1) = y0;
% sets the inital x and y values for all particles, as they all
% hypothetically start at the same point

[rows, columns] = size(output);
for r = 1:rows;
    for c = 2:columns;
    output(r,c) = normrnd(0,1);
    end
end
% This initial loop is to assign each index of output with  a random number
% from a normal distribution (mean = 0, sigma=1)

% While this loop takes 20-30 seconds to complete, it allows the final
% output for loop over TIME simulation to run much faster

% The difference between the following(see below) loop and the loop in the
% original particle tracking animation is that there is a nested for and if
% loop which identifies the number of particles in the forbidden well
% region for each time

number_in_region = zeros(1,length(time));

    for t = 0+dt:dt:0.5
        % time loop from the first time interval to 0.5
        
       output(1:1000,round((t/interval)+1)) = x0 + sqrt(2 * D * t) .* output(1:1000,round((t/interval)+1)) + v * t;
       % sets the 1st 1000 rows, rounded((0.001/0.001)+1) = (1,t) for time
       % equals 0.001 and beyond, then takes each normrnd value of that 
       % index and funnels it through the x position equation 
       
       output(1001:2000,round((t/interval)+1)) = y0 + sqrt(2 * D * t) .* output(1001:2000,round((t/interval)+1));
       % does the same for the rows 1001:2000 and the y position equation
       
       x = output(1:1000,round((t/interval)+1));
       % sets each of these outputs to x
       
       y = output(1001:2000,round((t/interval)+1));
       % sets each of these outputs to y
       
       for i = 1:1000;
               if output(i,round((t/interval)+1)) >= 4.5 & output(i,round((t/interval)+1)) <= 5.5 & output(i+1000,round((t/interval)+1)) >= 4.5 & output(i+1000,round((t/interval)+1)) <= 5.5;
% Since all x values are 1:1000, with their corresponding y values at
% 1001:2000, this if/and statement finds each particle in the region of
% 4.5 <= x <= 5.5 and the same for y

                   number_in_region(round((t/interval)+1)) = number_in_region(round((t/interval)+1)) + 1;
% adds 1 to number_in_region if particle is there          
               end
       end
  
       
    end
    plot(time,number_in_region,'b')
% plots the concentration (number_in_region vector) on the y-axis as a
% function of time on the x-axis

    ylim([0,20])
% limits the y values shown from 0 to 20 to help clarify graphically the
% time at which the water valve should be shut off
end