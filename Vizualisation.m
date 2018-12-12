function Vizualisation(agentInfo, p)
t = p.t;
N = p.N;
nAgents = p.nAgents;

figure(1)

set(groot, 'defaultFigureUnits','normalized')
set(groot, 'defaultFigurePosition',[0 0 1 1])

buildingPos = p.buildingPos;


positions = zeros(nAgents,2);
car_index = [];
bike_index = [];
for i = 1:nAgents
    positions(i,:) = agentInfo{i}{1};
    state(i) = agentInfo{i}{3};
    
    if state(i) == 1
        car_index(end+1) = i;
    else
        bike_index(end+1) = i;
    end
end

clf
yPositions = p.N+1-positions(:,2);

correct_positions = [positions(:,1),yPositions];

carPositions = correct_positions(car_index,:);
bikePositions = correct_positions(bike_index,:);

scatter(carPositions(:,1),carPositions(:,2),'b','square', 'Filled')
hold on
scatter(bikePositions(:,1),bikePositions(:,2),'r','+')




%gscatter(positions(:,1),yPositions, state','br','square')
hLeg = legend('example');
set(hLeg,'visible','off');

%gray=[0.5 0.5 0.5].*ones(p.nAgents,1);
hold on
scatter(buildingPos(:,1),buildingPos(:,2),N*50,'square','Filled','black')
if mod(p.t,p.waitingTime) < p.waitingTime/2
    title(['t = ', num2str(t),' [s]',', green for left/right'])
    hold on
else
    title(['t = ', num2str(t),' [s]',', green for up/down'])
    hold on
end

grid on
axis([0 N+1 0 N+1])
axis square

drawnow;


