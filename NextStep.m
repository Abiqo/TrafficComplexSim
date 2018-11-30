function [nextStep] = NextStep(positions, i, destination, cityMap, N, previousStep)

closestPoints = [positions(i,1),positions(i,2)+1; positions(i,1),positions(i,2)-1; positions(i,1) + 1,positions(i,2);positions(i,1) - 1,positions(i,2)];

for j = 1:size(closestPoints,1)
    
    if closestPoints(j,1) > N || closestPoints(j,1) <= 0 || closestPoints(j,2) > N || closestPoints(j,2) <= 0
        closestPoints(j,:) = [inf, inf];
    elseif cityMap(closestPoints(j,1), closestPoints(j,2)) == 0
        closestPoints(j,:) = [inf, inf];
        
    elseif closestPoints(j,1) == previousStep(i,1) && closestPoints(j,2) == previousStep(i,2)
        closestPoints(j,:) = [inf, inf];
        
    elseif cityMap(closestPoints(j,1), closestPoints(j,2)) == 2
%         checkStatus = intersections;
    end
        
    
end

[~,p] = ismember(closestPoints,[inf,inf],'rows');
indices = find(p == 1);
closestPoints(indices,:) = [];


dist = sqrt((closestPoints(:,1)-destination(i,1)).^2 + (closestPoints(:,2)-destination(i,2)).^2);

nextStep = closestPoints(find(dist == min(dist),1),:);

