function dsr=f_sr(y,n)
suma=0; 
for i=1:length(y)   
    suma=suma+y(i);
end
dsr = suma/length(y);