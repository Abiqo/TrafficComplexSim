function [agentInfo] = CreateAgents(p)

% Stored in a cell array. First agent's info is reached by agentInfo{1}.
% To see the info on must write agentInfo{1}{x}, where x = 1,2,3,4 and 1
% --> position, 2 -- > destination, 3 --> state(i) and 4 --> velDelay.
% Thus, agentInfo{3}{2} will give the third agent's destination.

state = randsrc(p.nAgents,1, [1,2;p.probOfState(p.currentProportionIndex,:)]);
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