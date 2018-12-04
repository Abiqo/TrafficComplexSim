function cityMap = InitGrid(p)

N = p.N;
nSteps = p.nSteps;
cityMap=zeros(N);

for i=1:N
    for j=1:N
        if mod(i,nSteps)==1
            cityMap(i,j)=1;
        elseif mod(i,nSteps)==2
            cityMap(i,j)=2;
        elseif mod(j,nSteps)==1
            cityMap(i,j)=1;
        elseif mod(j,nSteps)==2
            cityMap(i,j)=2;
        end
    end
end

for i=1:N
    for j=1:N
        if mod(i,nSteps)==1 && mod(j,nSteps)==1
            cityMap(i,j) = 3;
        elseif mod(i,nSteps)==2 && mod(j,nSteps)==1
            cityMap(i,j) = 3;
        elseif mod(i,nSteps)==1 && mod(j,nSteps)==2
            cityMap(i,j) = 3;
        elseif mod(i,nSteps)==2 && mod(j,nSteps)==2
            cityMap(i,j)=3;
        end
    end 
end

