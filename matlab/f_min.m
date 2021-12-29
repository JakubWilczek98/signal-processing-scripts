function dmin=f_min(y,n)
min=y(1); 
for i=1:n    
    if min>y(i)
        min=y(i);
    end
end
dmin = min;