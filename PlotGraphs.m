function PlotGraphs(p)

figure(2)

carProportions = p.probOfState(:,1);
errBike = [];
for eachProportion = 1:p.currentProportionIndex
    currentBikeProportion = p.bikeHistory(:,eachProportion);
    meanBike(eachProportion,1) = mean(currentBikeProportion);

    errBike(end+1) = std(p.bikeHistory(:,eachProportion));

end

meanBike(end+1) = meanBike(1);
meanBike(1) = [];

errBike(end+1) = errBike(1);
errBike(1) = [];
errBike = errBike/sqrt(p.runs);



e1 = errorbar(flipud(carProportions),meanBike,errBike);
e1.Color = 'red';
e1.DisplayName = 'Bikes';
e1.Marker = 'o';
e1.MarkerSize = 5;
e1.MarkerEdgeColor = 'red';
e1.MarkerFaceColor = 'red';
hold on;
errCar = [];
for eachProportion = 1:p.currentProportionIndex
    currentCarProportion = p.carHistory(:,eachProportion);
    meanCar(eachProportion,1) = mean(currentCarProportion);
    errCar(end+1) = std(p.carHistory(:,eachProportion));

end
errCar = errCar/sqrt(p.runs);


e2 = errorbar(carProportions,meanCar,errCar);
e2.Color = 'blue';
e2.DisplayName = 'Cars';
e2.Marker = 'square';
e2.MarkerSize = 5; 
e2.MarkerEdgeColor = 'blue';
e2.MarkerFaceColor = 'blue';
xlabel('Car proportions','FontSize',20); ylabel('Mean travel time','FontSize',20); legend;
text1 = ['Number of runs =  %d'];
text2 = ['Number of agents = %d'];
str1 = sprintf(text1,p.runs);
str2 = sprintf(text2,p.nAgents_start)
title({str1,str2})
