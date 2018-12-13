clear; clc; close all

p = CreateParameters([]);
testProportionSize = size(p.probOfState,1);
runs=3;

%Test each proportion!
while(p.currentProportionIndex < testProportionSize)
    p.currentProportionIndex = p.currentProportionIndex + 1;
    p.currentProportionIndex
    for i=1:runs
        i
        p = ResetParameters(p);
        [agentInfo, previousStep] = CreateAgents(p);
        
        %Run until all the agents have reached a destination
        while(p.nAgents>0)
            p.t = p.t + 1;
            %Vizualisation(agentInfo, p)
            [agentInfo, previousStep, p] = UpdateAgents(agentInfo, p, previousStep);
        end
        p.proportionHistory.bikes(p.currentProportionIndex,1) = p.proportionHistory.bikes(p.currentProportionIndex,1)+ mean(p.bikeTimes);
        p.proportionHistory.cars(p.currentProportionIndex,1) =  p.proportionHistory.cars(p.currentProportionIndex,1) + mean(p.carTimes);
    end
end

p.proportionHistory.bikes=p.proportionHistory.bikes/runs;
p.proportionHistory.cars=p.proportionHistory.cars/runs;

PlotGraphs(p)