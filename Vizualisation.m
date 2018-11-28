function [] = Vizualisation(agentInfo, buildingPos, nAgents, t, N)
positions = zeros(nAgents,2);
for i = 1:nAgents
    positions(i,:) = agentInfo{i}{1};
    state(i) = agentInfo{i}{3};
end

clf

gscatter(positions(:,1),positions(:,2), state')
hLeg = legend('example');
set(hLeg,'visible','off');

hold on
scatter(buildingPos(:,1),buildingPos(:,2),1500,'square','Filled','black')
grid on
axis([0 N+1 0 N+1])
title(['t = ', num2str(t),' [s]'])
drawnow;
