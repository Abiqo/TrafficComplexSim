% main
clear
clc
nTimesteps = 100;
nAgents = 5;
N = 10; % N has to be a number of size 9*x+1 in order for the city to have a road in the outer bounds
nSteps = 3;
probOfState = [0.3 0.7]; %Car vs bike


cityMap=InitGrid(N, nSteps);

[agentInfo] = CreateAgents(nAgents,N,probOfState,cityMap); % Stored in a cell array. First agent's info is reached by agentInfo{1}.
% To see the info on must write agentInfo{1}{x}, where x = 1,2,3,4 and 1
% --> position, 2 -- > destination, 3 --> state(i) and 4 --> velDelay.
% Thus, agentInfo{3}{2} will give the third agent's destination.

buildingPos=CreateBuildings(cityMap);

t = 0;
for t=1:nTimesteps
    t = t + 1;
    
    Vizualisation(agentInfo, buildingPos, nAgents, t, N)
    %[agents] = UpdateAgents(agents,initialMatrix,range)
    
end
