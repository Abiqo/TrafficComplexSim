clear; clc; close all

p = CreateParameters([]);
testProportionSize = size(p.probOfState,1);

%Test each proportion!
while(p.currentProportionIndex < testProportionSize)
    p.currentProportionIndex = p.currentProportionIndex + 1;
    for i=1:p.runs
        p = ResetParameters(p);
        [agentInfo, previousStep] = CreateAgents(p);

        %Run until all the agents have reached a destination
        while(p.nAgents>0)
            p.t = p.t + 1;
            %Vizualisation(agentInfo, p)
            [agentInfo, previousStep, p] = UpdateAgents(agentInfo, p, previousStep);
        end        
        
        p.bikeHistory(i,p.currentProportionIndex) = mean(p.bikeTimes);
        p.carHistory(i,p.currentProportionIndex) = mean(p.carTimes);
        
    end
end

PlotGraphs(p)
