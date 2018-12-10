clear; clc; close all

p = CreateParameters([]);

testProportionSize = size(p.probOfState,1);

%Test each proportion!
while(p.currentProportionIndex < testProportionSize)
    p.currentProportionIndex = p.currentProportionIndex +1;
    [agentInfo] = CreateAgents(p);
    previousStep = ones(p.nAgents,2)*inf;
    p = ResetParameters(p);
    
    %Run until all the agents have reached a destination
    while(p.nAgents>0)
        p.t = p.t + 1;
        %Vizualisation(agentInfo, p)
        [agentInfo, previousStep, p] = UpdateAgents(agentInfo, p, previousStep);
    end
    
    p.proportionHistory.bikes(p.currentProportionIndex,1) = mean(p.bikeTimes);
    p.proportionHistory.cars(p.currentProportionIndex,1) = mean(p.carTimes);
    
end

PlotGraphs(p)