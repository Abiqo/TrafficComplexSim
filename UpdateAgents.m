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

p.storedPositions{p.t} = positions;
cars = find(state == 1);
positionOfCars = positions(cars,:);
p.storedCars{p.t} = positionOfCars;

% avoid mega queues
if p.t > 5
    olderPositions = p.storedCars{p.t-5};
    oldPositions = positionOfCars;
    
    count = 0;
    for i = 1:size(oldPositions,1)
        if ismember(oldPositions(i,:),olderPositions)
            count = count + 1;
        end
    end
    
    if count/size(oldPositions,1) > 0.6
        for k = 1:size(positionOfCars,1)
            mapState(k) = p.cityMap(positionOfCars(k,1),positionOfCars(k,2));
        end
        agents_intersection = find(mapState == 3);
        
        position_critical_agent = positionOfCars(agents_intersection,:);
    else
        position_critical_agent = [];
    end
else
    position_critical_agent = [];
    
end
   
%     if isequal(oldPositions,olderPositions) == 1
%         for k = 1:size(positionOfCars,1)
%             mapState(k) = p.cityMap(positionOfCars(k,1),positionOfCars(k,2));
%         end
%         agents_intersection = find(mapState == 3);
%         
%         position_critical_agent = positionOfCars(agents_intersection,:);
%     else
%         position_critical_agent = [];
%     end
% else
%     position_critical_agent = [];
%     
% end

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
        p.time(end+1) = p.t;
        p.savedState(end+1) = state(i);
        
    elseif sqrt((positions(i,1)-destination(i,1)).^2 + (positions(i,2)-destination(i,2)).^2) == 1 && p.cityMap(positions(i,1),positions(i,2)) ~= p.cityMap(destination(i,1),destination(i,2))
        agentInfo{i} = [];
        
        p.nAgents = p.nAgents - 1;
        p.time(end+1) = p.t;
        p.savedState(end+1) = state(i);
        
    % Update agent every nth step where n = vehicle delay
    elseif mod(p.t-1,delay)==0 
        
        nextStep(i,:) = NextStep(positions, i, destination, p, previousStep, positionOfCars, state, position_critical_agent);
        thisRoadType=p.cityMap(positions(i,1),positions(i,2));
        nextRoadType=p.cityMap(nextStep(i,1),nextStep(i,2));
        
        if mod(p.t,p.waitingTime) < p.waitingTime/2    % up/down don't move
            if thisRoadType~=3 && nextRoadType==3 && positions(i,2)~= nextStep(i,2)
                nextStep(i,:)=positions(i,:); %don't move
            end
        elseif mod(p.t,p.waitingTime) >= p.waitingTime/2    % right/left don't move
            if thisRoadType~=3 && nextRoadType==3 && positions(i,1)~= nextStep(i,1)
                nextStep(i,:)=positions(i,:); %don't move
            end
        end
        
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
