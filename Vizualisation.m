function Vizualisation(agentInfo, p)

figure(1)
buildingPos = p.buildingPos;
t = p.t;
N = p.N;
nAgents = p.nAgents;

positions = zeros(nAgents,2);
for i = 1:nAgents
    positions(i,:) = agentInfo{i}{1};
    state(i) = agentInfo{i}{3};
end

clf
yPositions = p.N+1-positions(:,2) ;
gscatter(positions(:,1),yPositions, state')
hLeg = legend('example');
set(hLeg,'visible','off');

%gray=[0.5 0.5 0.5].*ones(p.nAgents,1);
hold on
scatter(buildingPos(:,1),buildingPos(:,2),N,'square','Filled','black')
if mod(p.t,p.waitingTime) < p.waitingTime/2
    title(['t = ', num2str(t),' [s]',', green for left/right'])
    hold on
else
    title(['t = ', num2str(t),' [s]',', green for up/down'])
    hold on
end
grid on
axis([0 N+1 0 N+1])
drawnow;
