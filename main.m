% main
clear; clc; close all

p = CreateParameters();
p.cityMap=InitGrid(p);

[agentInfo] = CreateAgents(p); % Stored in a cell array. First agent's info is reached by agentInfo{1}.
% To see the info on must write agentInfo{1}{x}, where x = 1,2,3,4 and 1
% --> position, 2 -- > destination, 3 --> state(i) and 4 --> velDelay.
% Thus, agentInfo{3}{2} will give the third agent's destination.

p.buildingPos=CreateBuildings(p);
p.intersectionPositions = IntersectionPositions(p);

previousStep = ones(p.nAgents,2)*inf;
for T=1:p.nTimesteps
    p.t = p.t + 1;
    Vizualisation(agentInfo, p)
    [agentInfo, previousStep, p] = UpdateAgents(agentInfo, p, previousStep);
    pause(0.1)  
end

