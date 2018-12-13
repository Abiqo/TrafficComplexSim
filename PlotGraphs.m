function PlotGraphs(p)

figure(2)

carProportions = p.probOfState(:,1);

for eachProportion = 1:p.currentProportionIndex
    currentBikeProportion = p.bikeHistory(:,eachProportion);
    meanBike(eachProportion,1) = mean(currentBikeProportion);
    minBike = min(currentBikeProportion);
    negativeYDifferenceBike(eachProportion,1) = meanBike(eachProportion,1) - minBike;
    
    maxBike = max(currentBikeProportion);
    positiveYDifferenceBike(eachProportion,1) = maxBike - meanBike(eachProportion,1);
end

e1 = errorbar(carProportions,meanBike,negativeYDifferenceBike,positiveYDifferenceBike);
e1.Color = 'red';
e1.DisplayName = 'Bikes';
e1.Marker = 'o';
e1.MarkerSize = 5;
e1.MarkerEdgeColor = 'red';
e1.MarkerFaceColor = 'red';
hold on;


for eachProportion = 1:p.currentProportionIndex
    currentCarProportion = p.carHistory(:,eachProportion);
    meanCar(eachProportion,1) = mean(currentCarProportion);
    minCar = min(currentCarProportion);
    negativeYDifferenceBike(eachProportion,1) = meanCar(eachProportion,1) - minCar;
    
    maxCar = max(currentCarProportion);
    positiveYDifferenceBike(eachProportion,1) = maxCar - meanCar(eachProportion,1);
end
e2 = errorbar(flipud(carProportions),meanCar,negativeYDifferenceBike,positiveYDifferenceBike);
e2.Color = 'blue';
e2.DisplayName = 'Cars';
e2.Marker = 'square';
e2.MarkerSize = 5; 
e2.MarkerEdgeColor = 'blue';
e2.MarkerFaceColor = 'blue';
xlabel('Car proportions'); ylabel('Travel time'); legend;
text1 = ['Mean and deviation of %d samples where'];
text2 = ['Number of agents = %d'];
str1 = sprintf(text1,p.runs);
str2 = sprintf(text2,p.nAgents_start)
title({str1,str2})
