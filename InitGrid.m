function cityMap = InitGrid(N, nSteps)

cityMap=zeros(N);

for i=1:N
    for j=1:N
        if mod(i,nSteps)==1
            cityMap(i,j)=1;           
        elseif mod(j,nSteps)==1
            cityMap(i,j)=1;
        end
    end
end

for i=1:nSteps:N
    for j=1:nSteps:N
        cityMap(i,j) = 2;
    end 
end

