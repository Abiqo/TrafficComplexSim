function proportions = CreateStateProportions()

for i = 1:11
   proportions(i,:) = [1-(i-1)*0.1, (i-1)*0.1];
end