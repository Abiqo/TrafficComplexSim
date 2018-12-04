function [closestPoints] = possibleSteps(sideOfRoad,positions,i, p)
if sideOfRoad == 1
    closestPoints = [positions(i,1),positions(i,2)-1;positions(i,1) + 1,positions(i,2)];
    
elseif sideOfRoad == 2
    closestPoints = [positions(i,1),positions(i,2)+1; positions(i,1) - 1,positions(i,2)];
elseif sideOfRoad == 3
    if positions(i,2)-1 > 0 && positions(i,2)+1 <= p.N && positions(i,1)-1 > 0 && positions(i,1)+1 <= p.N
        
        if p.cityMap(positions(i,1),positions(i,2)-1) ~= 3 && p.cityMap(positions(i,1)-1,positions(i,2)) ~= 3
            closestPoints = [positions(i,1) + 1,positions(i,2);positions(i,1),positions(i,2)-1];
            
        elseif p.cityMap(positions(i,1),positions(i,2)-1) ~= 3 && p.cityMap(positions(i,1)+1,positions(i,2)) ~= 3
            closestPoints = [positions(i,1) + 1,positions(i,2);positions(i,1),positions(i,2)+1];
            
        elseif p.cityMap(positions(i,1),positions(i,2)+1) ~= 3 && p.cityMap(positions(i,1)-1,positions(i,2)) ~= 3
            closestPoints = [positions(i,1)-1,positions(i,2);positions(i,1),positions(i,2)-1];
            
        elseif p.cityMap(positions(i,1),positions(i,2)+1) ~= 3 && p.cityMap(positions(i,1)+1,positions(i,2)) ~= 3
            closestPoints = [positions(i,1)-1,positions(i,2);positions(i,1),positions(i,2)+1];
        end
        
    elseif positions(i,2)-1 > 0 && positions(i,1)-1 > 0 && positions(i,1)+1 <= p.N
        if p.cityMap(positions(i,1)-1,positions(i,2)) ~= 3
            closestPoints = [positions(i,1)-1,positions(i,2); positions(i,1),positions(i,2)-1];
            
        else
            closestPoints = [positions(i,1),positions(i,2)-1;positions(i,1)-1,positions(i,2)];
        end
        
        
    elseif positions(i,2)+1 <= p.N && positions(i,1)-1 > 0 && positions(i,2)-1 > 0
        if p.cityMap(positions(i,1),positions(i,2)-1) ~= 3
            closestPoints = [positions(i,1),positions(i,2)+1];
        else
            closestPoints = [positions(i,1)+1,positions(i,2);positions(i,1)-1,positions(i,2)];
        end
        
    elseif positions(i,2)-1 > 0 && positions(i,1)+1 <= p.N && positions(i,2)+1 <= p.N
        if p.cityMap(positions(i,1),positions(i,2)-1) ~= 3
            closestPoints = [positions(i,1),positions(i,2)-1; positions(i,1)+1,positions(i,2)];
            
        else
            closestPoints = [positions(i,1),positions(i,2)-1];
        end
        
        
    elseif positions(i,2)+1 <= p.N && positions(i,1)-1 > 0 && positions(i,1)+1 <= p.N
        if p.cityMap(positions(i,1)-1,positions(i,2)) ~= 3
            closestPoints = [positions(i,1)+1,positions(i,2)];
        else
            closestPoints = [positions(i,1)+1,positions(i,2);positions(i,1),positions(i,2)+1];
        end
        
        
        
    elseif positions(i,2)-1 > 0 && positions(i,1)+1 <= p.N
        closestPoints = [positions(i,1),positions(i,2)-1];
        
    elseif positions(i,2)-1 > 0 && positions(i,1)-1 > 0
        closestPoints = [positions(i,1)-1,positions(i,2)];
        
    elseif positions(i,2)+1 <= p.N && positions(i,1)-1 > 0
        closestPoints = [positions(i,1),positions(i,2)+1];
        
    elseif positions(i,2)+1 <= p.N && positions(i,1)+1 <= p.N
        closestPoints = [positions(i,1)+1,positions(i,2)];
        
        
    end
end