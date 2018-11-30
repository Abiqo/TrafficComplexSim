% main
clear
clc
nTimesteps = 100;
nAgents = 100;
N = 100; % N has to be a number of size 9*x+1 in order for the city to have a road in the outer bounds
nSteps = 8;
probOfState = [0.3 0.7]; %Car vs bike


cityMap=InitGrid(N, nSteps);

[agentInfo] = CreateAgents(nAgents,N,probOfState,cityMap); % Stored in a cell array. First agent's info is reached by agentInfo{1}.
% To see the info on must write agentInfo{1}{x}, where x = 1,2,3,4 and 1
% --> position, 2 -- > destination, 3 --> state(i) and 4 --> velDelay.
% Thus, agentInfo{3}{2} will give the third agent's destination.

buildingPos=CreateBuildings(cityMap);

t = 0;
for T=1:nTimesteps
    t = t + 1;
    if t <= 1
        previousStep = [];
    end
    Vizualisation(agentInfo, buildingPos, nAgents, t, N)
    [agentInfo, previousStep] = UpdateAgents(agentInfo,cityMap,N, nAgents,t ,previousStep);
    
end
