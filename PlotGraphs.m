function PlotGraphs(p)

figure(2)

carProportions = p.probOfState(:,1);

plot(carProportions,p.proportionHistory.cars,'red')
hold on;
plot(carProportions,p.proportionHistory.bikes,'blue');

legend('Cars','Bikes');
xlabel('Car proportions'); ylabel('Travel time');
