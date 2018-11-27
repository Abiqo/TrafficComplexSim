
N=7;
cityMap=InitGrid(N);
agentPos=CreateAgents(cityMap,N);
buildingPos=CreateBuildings(cityMap,N);
scatter(agentPos(:,1),agentPos(:,2),'Filled','r')
hold on
scatter(buildingPos(:,1),buildingPos(:,2),1500,'square','Filled','black')
grid on
axis([1 N 1 N])
