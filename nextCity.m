
function j = nextCity(p, unVisitedCity)
    r = rand();
    c = cumsum(p);
    j = unVisitedCity(find(r<=c,1));    
end