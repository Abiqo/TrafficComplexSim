
function buildingPos = CreateBuildings(cityMap)

[j,i] = find(cityMap == 0);
buildingPos = [i,j];