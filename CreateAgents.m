function [agentInfo] = CreateAgents(p)

state = randsrc(p.nAgents,1, [1,2;p.probOfState(1,:)]);
position = zeros(p.nAgents,1);
%destination = zeros(nAgents,1);
velDelay = zeros(p.nAgents,1);
agentInfo = cell(p.nAgents,1);

for i = 1:p.nAgents
    position(i,1:2) = randi(p.N,1,2);
    
    while p.cityMap(position(i,1),position(i,2)) == 0 || p.cityMap(position(i,1),position(i,2)) == 2
        position(i,1:2) = randi(p.N,1,2);
    end
    
    
    destination(i,1:2) = randi(p.N,1,2);
    
    while p.cityMap(destination(i,1),destination(i,2)) == 0 || ismember(destination(i,1:2),position(i,1:2),'rows') == 1 
        destination(i,1:2) = randi(p.N,1,2);
    end
    
   
    if find(state(i)==1)
        velDelay(i) = 1;
    elseif find(state(i)==2)
        velDelay(i) = 4;
    end
    
    agentInfo{i}={position(i,1:2);destination(i,1:2);state(i);velDelay(i)};
end