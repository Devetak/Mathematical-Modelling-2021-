% input : h, maxIt representing the simulation constants
%       : r, v, totEn representing the dynamics of the position, velocity
%         and total energy of the ball
%       : name representing the name of the graphs
function plotResults(h, maxIt, r, v, totEn, name)

    time = (1:maxIt) * h;

    % plot poistion of the ball in respect to time
    
    figure
    
    plot(time,r);
    hold on;
    
    % define treshold for graphing the x-axis
    treshold = 0.3;
    
    if r(end) < treshold
        line(xlim, [0 0], 'Color', 'black');
    end
    
    legend('Position of the ' + name + ' ball');

    title('Position of the ' + name + ' ball in respect of time')
    xlabel('Time')
    ylabel('r(t)')

    % plot velocity of ball in respect to time
    
    figure
    
    plot(time,v);
    legend('Velocity of the ' + name + ' ball');

    title('Velocity of the ' + name + ' ball in respect of time')
    xlabel('Time')
    ylabel('v(t)')

    % plot total energy of the ball in respect to time

    figure 

    plot(time,totEn);
    legend('Total energy of the ' + name + 'ball');

    title('Energy of the ' + name + ' ball in respect of time')
    xlabel('Time')
    ylabel('E(t)')
    
end
