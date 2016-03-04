% Byron Becker
% COEN Final Project - Particle Tracking
% Section 408
% 4-6-15

% This code will simulate a groundwater aquifer, and where a contanminant is
% in the system when included. This is helpful if one needs to determine
% when and for how long to shut of the well in order to avoid contamination
% of drinking water

% TA is Dan - zurawki@Colorado.edu

% Instructions: Type Particle_tracking(Input D constant, velocity value v)
% As this is a function, Diffusivity, velocity, and increments of time are
% not yet determined and need to be defined

% Interpretation: For a numerical interpretation, view the output matrix 
% by doubleclicking on answer in the workspace. For a graphical
% interpretation, see write-up.

function output = Particle_tracking(D,v,dt)
% Dependent on D = Diffusivity Constant v = input velocity dt = time
% increments

t = [0:dt:0.5];
% creates a vector t that can be changed for different time increments

x0 = 0.01; 
y0 = 5;

% sets initial x and y values

figure 
% was told opening up the figure first might speed up the plot

interval = dt; 
% creates a variable later used in the final for loop for output indexing

output = zeros(2000,length(t));
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
       
       clf
       % clears the figure each time
       
       scatter(x,y,'b')
       hold on
       plot([4.5 5.5 5.5 4.5 4.5],[4.5 4.5 5.5 5.5 4.5],'r')
       xlim([-2 13]);
       ylim([0 10]);
       % creates a scatter plot for each time with x and y limits to keep 
       % the graph steady, as well as plotting a red square representing
       % the region of the well
       
       pause(0.05)
       % pauses every 0.05 sec to animate the particle motion
    end    
end
