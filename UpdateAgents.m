function  [agentInfo, previousStep, p] = UpdateAgents(agentInfo,p,previousStep)
%Assuming agents is a struct with
% pos[x y]
% velDelay || a scalar 1 or 4
% dest [x y] vector
% state || a scalar 1 or 2
for i = 1:p.nAgents
    positions(i,:) = agentInfo{i}{1};
    state(i) = agentInfo{i}{3};
    
end

cars = find(state == 1);
positionOfCars = positions(cars,:);


%Update the agents
for i = 1:p.nAgents
%     positions(i,:) = agentInfo{i}{1};
%     state(i) = agentInfo{i}{3};
    destination(i,:) = agentInfo{i}{2};
    delay=agentInfo{i}{4};
   

    %If the position of the agent and its destination are the same
    %dont change anything
    if positions(i,1) == destination(i,1) && positions(i,2) == destination(i,2)
         %agentInfo{i}{1} = positions(i,:);
         agentInfo{i} = [];

         p.nAgents = p.nAgents - 1;
         p.time(i) = p.t;
         

    
    % Update agent every nth step where n = vehicle delay
    elseif mod(p.t-1,delay)==0
        nextStep(i,:) = NextStep(positions, i, destination, p, previousStep, positionOfCars);
        
        %Check if the nextStep is at intersection
        atIntersection = ismember(p.intersectionPositions,nextStep(i,:),'rows');
        atIntersection = any(atIntersection);
        if(atIntersection)
            %Check if nextStep is already in "agentsAtIntersection"
            alreadyMember = 0;
            if(~isempty(p.agentsAtIntersection))
                alreadyMember = ismember(p.agentsAtIntersection, nextStep(i,:),'rows');
                alreadyMember = any(alreadyMember);
            end
            %If it is not, add it to the list "agentsAtIntersection"
            if(~alreadyMember)
                p.agentsAtIntersection(end+1,:) = nextStep(i, :);
            end
        end
        
        %If nextStep ~
        agentInfo{i}{1} = nextStep(i,:);
        
    end
    previousStep(i,:) = positions(i,:);
end

%Remove agents that are at its destination
emptyCells = find(cellfun(@isempty,agentInfo));
agentInfo(emptyCells) = [];
