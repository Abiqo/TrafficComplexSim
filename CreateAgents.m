function [agentInfo, previousStep] = CreateAgents(p)

state = randsrc(p.nAgents,1, [1,2;p.probOfState(p.currentProportionIndex,:)]);
position = zeros(p.nAgents,1);
destination = zeros(p.nAgents,1);
velDelay = zeros(p.nAgents,1);
agentInfo = cell(p.nAgents,1);
occupiedSpots=[inf inf];

for i = 1:p.nAgents
    position(i,1:2) = randi(p.N,1,2);
    
    while p.cityMap(position(i,1),position(i,2)) == 0 || p.cityMap(position(i,1),position(i,2)) == 3 || ismember(position(i,:),occupiedSpots,'rows')==1
        position(i,1:2) = randi(p.N,1,2);
    end
    
    occupiedSpots(i,:)=position(i,:);
    sideOfRoad = p.cityMap(position(i,1),position(i,2));
    destination(i,1:2) = randi(p.N,1,2);
    
    while p.cityMap(destination(i,1),destination(i,2)) == 0 || ismember(destination(i,1:2),position(i,1:2),'rows') == 1 ||  p.cityMap(destination(i,1),destination(i,2)) == 3
        destination(i,1:2) = randi(p.N,1,2);
    end
    
   if find(state(i)==1)
        velDelay(i) = 2;
    elseif find(state(i)==2)
        velDelay(i) = 2;
   end
    agentInfo{i}={position(i,1:2);destination(i,1:2);state(i);velDelay(i)};
end

previousStep = position;