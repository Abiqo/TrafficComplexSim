function cityMap = InitGrid(N)

cityMap=zeros(N);

for i=1:N
    for j=1:N
        if mod(i,2)==1
            cityMap(i,j)=1;           
        elseif mod(j,2)==1
            cityMap(i,j)=1;
        end
    end
end
