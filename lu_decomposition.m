function [ Lower, Upper, Pivot ] = lu_decomposition( A )
    Upper = A;
    [ m, n ] = size( A ); 
    I = eye(n);
    Lower = I; 
    Pivot = I;
    index = 0;
    for k = 1 : m -1
        [~, index]= max(abs(Upper(k:m,k)));
        
        Upper([k,index],k:m)=Upper([index,k],k:m);
        Lower([k,index],1:k-1)=Lower([index,k],1:k-1);
        Pivot([k,index],:)=Pivot([index,k],:);
        for j = k + 1 : m
            Lower(j,k)=Upper(j,k)/Upper(k,k);
            Upper(j,k:m)=Upper(j,k:m)-Lower(j,k)*Upper(k,k:m);
        end
    end
end