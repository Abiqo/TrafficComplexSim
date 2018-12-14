clc; clear; close;

    load('gridsize_9.mat');
    proportion = 0.3;
    carColumn = 3;
    bikeColumn = 12 - carColumn;
    figure(1)
    meanBikeHolder = zeros(9,1);
    errorBikeHolder = zeros(9,1);
    meanCarHolder = zeros(9,1);
    errorCarHolder = zeros(9,1);
    bikeProportion = p.bikeHistory(:,bikeColumn);
    carProportion = p.carHistory(:,carColumn);
    meanBikes = mean(bikeProportion);
    errorBikes = std(bikeProportion);
    meanCars = mean(carProportion);
    errorCars = std(carProportion);
    
    
    
    meanBikeHolder(1) = meanBikes;
    errorBikeHolder(1) = errorBikes;
    meanCarHolder(1) = meanCars;
    errorCarHolder(1) = errorCars;
    
    clear p;
    load('gridsize_16.mat');
    
    bikeProportion = p.bikeHistory(:,bikeColumn);
    carProportion = p.carHistory(:,carColumn);
    meanBikes = mean(bikeProportion);
    errorBikes = std(bikeProportion);
    meanCars = mean(carProportion);
    errorCars = std(carProportion);
    
    meanBikeHolder(2) = meanBikes;
    errorBikeHolder(2) = errorBikes;
    meanCarHolder(2) = meanCars;
    errorCarHolder(2) = errorCars;
    
    
    clear p;
    load('gridsize_23.mat');
    
    bikeProportion = p.bikeHistory(:,bikeColumn);
    carProportion = p.carHistory(:,carColumn);
    meanBikes = mean(bikeProportion);
    errorBikes = std(bikeProportion);
    meanCars = mean(carProportion);
    errorCars = std(carProportion);
    
    meanBikeHolder(3) = meanBikes;
    errorBikeHolder(3) = errorBikes;
    meanCarHolder(3) = meanCars;
    errorCarHolder(3) = errorCars;
    
    clear p;
    load('gridsize_30.mat');
    
    bikeProportion = p.bikeHistory(:,bikeColumn);
    carProportion = p.carHistory(:,carColumn);
    meanBikes = mean(bikeProportion);
    errorBikes = std(bikeProportion);
    meanCars = mean(carProportion);
    errorCars = std(carProportion);
    
    meanBikeHolder(4) = meanBikes;
    errorBikeHolder(4) = errorBikes;
    meanCarHolder(4) = meanCars;
    errorCarHolder(4) = errorCars;
    
    clear p;
    load('gridsize_37.mat');
    
    bikeProportion = p.bikeHistory(:,bikeColumn);
    carProportion = p.carHistory(:,carColumn);
    meanBikes = mean(bikeProportion);
    errorBikes = std(bikeProportion);
    meanCars = mean(carProportion);
    errorCars = std(carProportion);
    
    meanBikeHolder(5) = meanBikes;
    errorBikeHolder(5) = errorBikes;
    meanCarHolder(5) = meanCars;
    errorCarHolder(5) = errorCars;
    
    clear p;
    load('gridsize_44.mat');
    
    bikeProportion = p.bikeHistory(:,bikeColumn);
    carProportion = p.carHistory(:,carColumn);
    meanBikes = mean(bikeProportion);
    errorBikes = std(bikeProportion);
    meanCars = mean(carProportion);
    errorCars = std(carProportion);
    
    meanBikeHolder(6) = meanBikes;
    errorBikeHolder(6) = errorBikes;
    meanCarHolder(6) = meanCars;
    errorCarHolder(6) = errorCars;
    
    clear p;
    load('gridsize_51.mat');
    
    bikeProportion = p.bikeHistory(:,bikeColumn);
    carProportion = p.carHistory(:,carColumn);
    meanBikes = mean(bikeProportion);
    errorBikes = std(bikeProportion);
    meanCars = mean(carProportion);
    errorCars = std(carProportion);
    
    meanBikeHolder(7) = meanBikes;
    errorBikeHolder(7) = errorBikes;
    meanCarHolder(7) = meanCars;
    errorCarHolder(7) = errorCars;
    
    clear p;
    load('gridsize_58.mat');
    
    bikeProportion = p.bikeHistory(:,bikeColumn);
    carProportion = p.carHistory(:,carColumn);
    meanBikes = mean(bikeProportion);
    errorBikes = std(bikeProportion);
    meanCars = mean(carProportion);
    errorCars = std(carProportion);
    
    meanBikeHolder(8) = meanBikes;
    errorBikeHolder(8) = errorBikes;
    meanCarHolder(8) = meanCars;
    errorCarHolder(8) = errorCars;
    
    clear p;
    load('gridsize_65.mat');
    
    bikeProportion = p.bikeHistory(:,bikeColumn);
    carProportion = p.carHistory(:,carColumn);
    meanBikes = mean(bikeProportion);
    errorBikes = std(bikeProportion);
    meanCars = mean(carProportion);
    errorCars = std(carProportion);
    
    meanBikeHolder(9) = meanBikes;
    errorBikeHolder(9) = errorBikes;
    meanCarHolder(9) = meanCars;
    errorCarHolder(9) = errorCars;
    
    xAxis = [40 120 240 400 600 840 1120 1440 1800];
    errorbar(xAxis,meanBikeHolder,errorBikeHolder,'r-+')
    hold on
    errorbar(xAxis,meanCarHolder,errorCarHolder,'b-s')
    xlabel('Number of Agents')
    ylabel('Travel Time')
    string = sprintf('Proportions of cars and bikes is %d',proportion);
    title(string)
