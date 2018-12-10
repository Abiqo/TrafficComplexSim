function [nextStep] = NextStep(positions, i, destination, p, previousStep, positionOfCars, state, position_critical_agent)


sideOfRoad = p.cityMap(positions(i,1),positions(i,2));
sideOfRoad_destination = p.cityMap(destination(i,1),destination(i,2));

if destination(i,2)+1 < p.N
    if p.cityMap(destination(i,1),destination(i,2)+1) == sideOfRoad_destination
        if sideOfRoad_destination == 1
            opposite_destination = [destination(i,1)+1,destination(i,2)];
        else
            opposite_destination = [destination(i,1)-1,destination(i,2)];
        end
    else
        
        if sideOfRoad_destination == 1
            opposite_destination = [destination(i,1),destination(i,2)+1];
        else
            opposite_destination = [destination(i,1),destination(i,2)-1];
        end
    end
    
else
    opposite_destination = [destination(i,1),destination(i,2) - 1];
end

[closestPoints] = possibleSteps(sideOfRoad,positions,i, p);

for j = 1:size(closestPoints,1)
    nextX = closestPoints(j,1);
    nextY = closestPoints(j,2);
    
    %If the nextX/nextY are out of the boundaries
    if nextX > p.N || nextX <= 0 || nextY > p.N || nextY <= 0
        closestPoints(j,:) = [inf, inf];
        
        %if the nextpoint is a building
    elseif p.cityMap(nextX, nextY) == 0
        closestPoints(j,:) = [inf, inf];
        %if the nextpoint is the same as previous point
    elseif nextX == previousStep(i,1) && nextY == previousStep(i,2)
        closestPoints(j,:) = [inf, inf];
        
        % Check so next step is not change of lane
    elseif p.cityMap(nextX,nextY)*sideOfRoad == 2
        closestPoints(j,:) = [inf, inf];
        
    end
    
end

%If closestpoint is infinite, remove them from closestPoints!
[~,l] = ismember(closestPoints,[inf,inf],'rows');
indices = find(l == 1);
closestPoints(indices,:) = [];
    
%Calculate the distance between destination and the nextpoint
dist_direction = sqrt((closestPoints(:,1)-destination(i,1)).^2 + (closestPoints(:,2)-destination(i,2)).^2);
dist_direction_opposite = sqrt((closestPoints(:,1)-opposite_destination(1,1)).^2 + (closestPoints(:,2)-opposite_destination(1,2)).^2);

%Get the minimum distance of all the closestPoints
minDistanceDirection = min(dist_direction);
minDistanceDirectionOpposite = min(dist_direction_opposite);
maxDistance = max(dist_direction);


indexOfMin = find(dist_direction == minDistanceDirection,1);
indexOfMinOpposite = find(dist_direction_opposite == minDistanceDirectionOpposite,1);

if minDistanceDirectionOpposite < minDistanceDirection
    nextStep = closestPoints(indexOfMinOpposite,:);
else
    
    nextStep = closestPoints(indexOfMin,:);
end

%The next step is the closestPoint such that it is the minimum Distance
%nextStep = closestPoints(indexOfMin,:);

if isempty(nextStep) == 1 
        nextStep = positions(i,:);
end

if ismember(positions(i,:),position_critical_agent)
    if ismember(nextStep,positionOfCars, 'rows') == 1
        nextStep = closestPoints(find(dist_direction == maxDistance,1),:);
    end
end
if isempty(nextStep) == 1 
        nextStep = positions(i,:);
end

if state(i) == 1
    
    if isempty(nextStep) || ismember(nextStep,positionOfCars, 'rows')
        nextStep = positions(i,:);
    end
end



