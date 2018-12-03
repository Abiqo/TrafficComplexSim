function intersectionPositions = IntersectionPositions(p)
    
    [M,N] = find(p.cityMap == 2);
    intersectionPositions = [M,N];
end