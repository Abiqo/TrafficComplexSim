function agentPos =CreateAgents(cityMap,N)

nAgents=5;
agentPos=randi(N,nAgents,2)

for i=1:nAgents
    if mod(agentPos(i,1),2)==0
       if mod(agentPos(i,2),2)==0
           agentPos(i,2)=agentPos(i,2)-1;
       end
    end
end

