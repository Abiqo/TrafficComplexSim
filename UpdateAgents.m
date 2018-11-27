function  [agents] = UpdateAgents(agents,initialMatrix,range)
%Assuming agents is a struct with
% pos[x y]
% velDelay || a scalar 1 or 4
% dest [x y] vector
% state || a scalar 1 or 2

nAgents = size(agents,1);
for iAgent = 1:nAgents
    currentAgent = agents(i);
    x = currentAgent.pos(1)
    y = currentAgent.pos(2);
    destX = currentAgent.dest(1);
    destY = currentAgent.dest(2);
    differenceX = x - destX;
    differenceY = x - destY;
    
    %Decremet velDelay for the agent
    agents(i).velDelay = agents(i).velDelay - 1;
    if(agents(i).velDelay == 0)
        
        %Revert back to the original velDelay!
        if(agents(i).state == 1)
            agents(i).velDelay = 1;
        elseif(agents(i).state == 2)
            agents(i).velDelay = 4;
        end
        
        %If there is no difference, remove the agent!
        if(differenceX == 0 && differenceY == 0)
            agents(i) = [];
        end
        
        %Adjust X
        if(differenceX > 0)
            if(~initialMatrix(x-1,y))
                agents(i).pos(1) = x - 1;
            end
        end
        if(differenceX<0)
            if(~initialMatrix(x+1,y))
                agents(i).pos(1) = x + 1;
            end
        end
        
        
        if(differenceY > 0)
            if(~initialMatrix(x,y-1))
                agents(i).pos(2) = y - 1;
            end
        end
        if(differenceY<0)
            if(~initialMatrix(x,y+1))
                agents(i).pos(2) = y + 1;
            end
        end
        
    end %end of velDelay check
    
end