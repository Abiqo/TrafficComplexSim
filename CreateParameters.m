function p = CreateParameters()

p.t = 0;
p.nSteps = 7;
p.nAgents = 30;
p.time = zeros(1,p.nAgents);
p.nTimesteps = 1000;
p.previousStep = [];
p.N = 16; % N has to be a number of size k*nSteps+2 in order for the city to have a road in the outer bounds
p.probOfState = [1 0]; %Car vs bike
p.cityMap = [];
p.buildingPos = [];
p.intersectionPositions = [];
p.agentsAtIntersection = [];
