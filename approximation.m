function approxi = approximation(Mat, temps)
%Pas d'approximation linéaire (valeur négatives qui sortent de nulle part)
%Approximation à la valeur inférieure
    j=1;
   
    while Mat(j,1)<temps
        j=j+1;
    end
    
    approxi=Mat(j-1,2);
end
