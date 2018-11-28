function [agentInfo] = CreateAgents(nAgents,sizeOfGrid,probOfState,cityMap)

state = randsrc(nAgents,1, [1,2;probOfState(1,1),probOfState(1,2)]);
position = zeros(length(state),1);
destination = zeros(length(state),1);
velDelay = zeros(length(state),1);
agentInfo = cell(10,1);

for i = 1:length(state)
position(i,1:2) = randi(sizeOfGrid,1,2);
        while cityMap(position(i,1),position(i,2)) ~= 0
            position(i,1:2) = randi(sizeOfGrid,1,2);
        end
    
    
destination(i,1:2) = randi(sizeOfGrid,1,2);
   
        while cityMap(destination(i,1),destination(i,2)) ~= 1 && ismember(destination(i,1:2),position(i,1:2),'rows') == 1
            destination(i,1:2) = randi([1 sizeOfGrid],1,2);
        end
    


    if find(state(i)==1)
        velDelay(i) = 1;
    elseif find(state(i)==2)
        velDelay(i) = 4;
    end
    
agentInfo{i}={position(i,1:2);destination(i,1:2);state(i);velDelay(i)};
end