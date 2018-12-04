function p = CreateParameters()

p.t = 0;
p.nSteps = 7;
p.nAgents = 10;
p.nTimesteps = 100;
p.previousStep = [];
p.N = 23; % N has to be a number of size k*nSteps+2 in order for the city to have a road in the outer bounds
p.probOfState = [1 0]; %Car vs bike
p.cityMap = [];
p.buildingPos = [];
p.intersectionPositions = [];
p.agentsAtIntersection = [];
