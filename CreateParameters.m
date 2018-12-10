function p = CreateParameters()

p.t = 0;
p.nSteps = 7;
p.nAgents =1000;
p.waitingTime=20; % period of traffic light waiting time
p.storedCars = [];
p.savedState = [];
p.storedPositions = [];
p.time = [];
p.nTimesteps = 1000;
p.previousStep = [];
p.N = 51; % N has to be a number of size k*nSteps+2 in order for the city to have a road in the outer bounds
p.probOfState = [0.7 0.3]; %Car vs bike
p.cityMap = [];
p.buildingPos = [];
p.intersectionPositions = [];
p.agentsAtIntersection = [];
