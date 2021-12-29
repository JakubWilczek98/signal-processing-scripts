function dene=f_energia(y,n)
suma=0; 
for i=1:n    
    suma=suma+(y(i)).^2;
end
dene = suma;