function std=f_odchylenie(y)
sum=0;
for i=1:length(y)
    sum=sum+(y(i)-mean(y)).^2;
end
std=sqrt(sum/(length(y)-1));
end