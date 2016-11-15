function PlotTravel(city,tabu)
    tabu = [tabu tabu(1)];
    
    plot(city.x(tabu),city.y(tabu),'k-o',...
        'MarkerSize',10,...
        'MarkerFaceColor','r',...
        'LineWidth',1.5);
    xlabel('x');
    ylabel('y');
    
    
    grid on;
    
    
    alpha = 0.1;
	
    xmin = min(city.x);
    xmax = max(city.x);
    dx = xmax - xmin;
    xmin = floor((xmin - alpha*dx)/10)*10;
    xmax = ceil((xmax + alpha*dx)/10)*10;
    xlim([xmin xmax]);
    
    ymin = min(city.y);
    ymax = max(city.y);
    dy = ymax - ymin;
    ymin = floor((ymin - alpha*dy)/10)*10;
    ymax = ceil((ymax + alpha*dy)/10)*10;
    ylim([ymin ymax]);
end