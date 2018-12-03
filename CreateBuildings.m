
function buildingPos = CreateBuildings(p)

[j,i] = find(p.cityMap == 0);
buildingPos = [i,j];