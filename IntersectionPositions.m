function intersectionPositions = IntersectionPositions(p)
    
    [M,N] = find(p.cityMap == 3); %3 is new intersection index
    intersectionPositions = [M,N];
end