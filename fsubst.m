function [ x ] = fsubst( Lower, b )
    if nargin~=2
        error('Insufficient number of input parameters!');
    end

    [m, n] = size(Lower); 

    if m~=n
        error('The method only works for square matrices!');
    end


    x = zeros(m, 1);

    x(1) = b(1) / Lower(1, 1);
    for i = 2:m
        x(i) = (b(i) - Lower(i, 1:i-1)*x(1:i-1)) / Lower(i, i); 
    end

end

