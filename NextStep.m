function [nextStep] = NextStep(positions, i, destination, p, previousStep, positionOfCars)
sideOfRoad = p.cityMap(positions(i,1),positions(i,2));

[closestPoints] = possibleSteps(sideOfRoad,positions,i, p);
    
for j = 1:size(closestPoints,1)
    nextX = closestPoints(j,1);
    nextY = closestPoints(j,2);
    
    % TODO: 1) fix s.t. agents don't switch to forbidden lanes
    %2) fix starting positions vs. direction
    
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
dist = sqrt((closestPoints(:,1)-destination(i,1)).^2 + (closestPoints(:,2)-destination(i,2)).^2);
%Get the minimum distance of all the closestPoints
minDistance = min(dist);
indexOfMin = find(dist == minDistance,1);
%The next step is the closestPoint such that it is the minimum Distance
nextStep = closestPoints(indexOfMin,:);

if isempty(nextStep) == 1 || ismember(nextStep,positionOfCars, 'rows') == 1
    nextStep = positions(i,:);
end

