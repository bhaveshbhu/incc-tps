y1 = [datos(15,1,1).vector{1}.cantBurbujas];
y2 = [datos(15,1,1).vector{2}.cantBurbujas];
y3 = [datos(15,1,1).vector{3}.cantBurbujas];
y4 = [datos(15,1,1).vector{4}.cantBurbujas];
y5 = [datos(15,1,1).vector{5}.cantBurbujas];
y6 = [datos(15,1,1).vector{6}.cantBurbujas];
y7 = [datos(15,1,1).vector{7}.cantBurbujas];
y8 = [datos(15,1,1).vector{8}.cantBurbujas];
y9 = [datos(15,1,1).vector{9}.cantBurbujas];

[sorted, x1] = sort(ones(1,length(y1)));
[sorted, x2] = sort(ones(1,length(y2)));
[sorted, x3] = sort(ones(1,length(y3)));
[sorted, x4] = sort(ones(1,length(y4)));
[sorted, x5] = sort(ones(1,length(y5)));
[sorted, x6] = sort(ones(1,length(y6)));
[sorted, x7] = sort(ones(1,length(y7)));
[sorted, x8] = sort(ones(1,length(y8)));
[sorted, x9] = sort(ones(1,length(y9)));
clear sorted;

plot(x2,y2,'r',x3,y3,'g',x4,y4,'b',x5,y5,'c',x6,y6,'m',x7,y7,'y',x8,y8,'k',x9,y9,'--r');