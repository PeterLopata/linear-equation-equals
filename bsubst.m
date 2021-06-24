function [ x ] = bsubst( Upper, b )

    if nargin~=2
        error('Insufficient number of input parameters!');
    end

    [m, n] = size(Upper); 

    if m~=n
        error('The method only works for square matrices!');
    end

    x = zeros(m, 1);

    x(n) = b(n) / Upper(n, n);
    for i = n-1:-1:1
        x(i) = (b(i) - Upper(i, i+1:n)*x(i+1:n)) / Upper(i, i); 
    end


end

