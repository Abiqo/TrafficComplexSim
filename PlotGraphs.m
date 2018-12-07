function PlotGraphs(p)

figure(2)
legend('Cars','Bikes');
xlabel('Car proportions'); ylabel('Travel time');

carProportions = p.probOfState(1,:);

scatter(carProportions,p.proportionHistory.cars,'red')

scatter(carProportions,p.proportionHistory.bikes,'blue');

