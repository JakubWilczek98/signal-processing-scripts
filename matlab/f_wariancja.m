function var=f_wariancja(y)
sum=0;
for i=1:length(y)
    sum=sum+(y(i)-mean(y)).^2;
end
var=sum/(length(y)-1);
end