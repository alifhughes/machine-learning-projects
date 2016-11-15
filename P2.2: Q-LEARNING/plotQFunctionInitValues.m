function plotQFunctionInitValues(initQTable)

    % Plot the graph
    surf(initQTable);
    title('Q function table values');
    xlabel('actions');
    ylabel('states');
    zlabel('Q values');
    
    % Set the graph limits
    xlim([1 4]);
    ylim([1 11]);
    zlim([0 1]);

end

