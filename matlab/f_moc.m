function moc=f_moc(y,n,t)
suma=0; 
for i=1:n    
    suma=suma+(y(i)).^2;
end
moc = suma/t(end);