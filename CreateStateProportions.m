function proportions = CreateStateProportions()

for i = 1:8
   proportions(i,:) = [0.9-i*0.1 0.1+i*0.1];
end