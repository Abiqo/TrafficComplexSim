function p = CreateParameters()

p.t = 0;
p.nSteps = 8;
p.nAgents = 200;
p.nTimesteps = 1000;
p.previousStep = [];
p.N = 100; % N has to be a number of size 9*x+1 in order for the city to have a road in the outer bounds
p.probOfState = [0.9 0.1]; %Car vs bike
p.cityMap = [];
p.buildingPos = [];
p.intersectionPositions = [];
p.agentsAtIntersection = [];
