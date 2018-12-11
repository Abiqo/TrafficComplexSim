function p = CreateParameters(p)

p.t = 0;
p.nSteps = 7;
p.waitingTime=20; % period of traffic light waiting time
p.nAgents_start = 400;
p.nAgents = p.nAgents_start;
p.storedCars = [];
p.savedState = [];
p.storedPositions = [];
p.time = [];
p.nTimesteps = 1000;
p.previousStep = [];
p.N = 30; % N has to be a number of size k*nSteps+2 in order for the city to have a road in the outer bounds
%Create propability vector that it is a car/bike
p.probOfState = CreateStateProportions;
p.cityMap = InitGrid(p);
p.buildingPos = CreateBuildings(p);
p.intersectionPositions = IntersectionPositions(p);
p.agentsAtIntersection = [];
p.carTimes = [];
p.bikeTimes = [];
p.currentProportionIndex = 0;
p.proportionHistory.bikes = [];
p.proportionHistory.cars = [];