function buildingPos = CreateBuildings(mat,N)

k=1;

for i = 1: N
    for j=1:N
        if mod(j,2)==0 && mod(i,2)==0
            buildingPos(k,:)=[i,j];
            k=k+1;
        end
    end
end
