function [agentInfo] = CreateAgents(nAgents,sizeOfGrid,probOfState,initialMatrix)

state = randsrc(nAgents,1, [1,2;probOfState(1,1),probOfState(1,2)]);
position = zeros(nAgents,1);
destination = zeros(nAgents,1);
velDelay = zeros(nAgents,1);
agentInfo = cell(nAgents,1);

for i = 1:nAgents
position(i,1:2) = randi([1 sizeOfGrid],1,2);

        while initialMatrix(position(i,1),position(i,2)) ~= 1
            position(i,1:2) = randi([1 sizeOfGrid],1,2);
        end

destination(i,1:2) = randi([1 sizeOfGrid],1,2);
    
        while initialMatrix(destination(i,1),destination(i,2)) ~= 1 && ismember(destination(i,1:2),position(i,1:2),'rows') == 1 
            destination(i,1:2) = randi([1 sizeOfGrid],1,2);
        end

    if find(state(i)==1)
        velDelay(i) = 1;
    elseif find(state(i)==2)
        velDelay(i) = 4;
    end

agentInfo{i}={position(i,1:2);destination(i,1:2);state(i);velDelay(i)};
end