function dmax=f_max(y,n)
max=y(1); 
for i=1:n    
    if max<y(i)
        max=y(i);
    end
end
dmax = max;