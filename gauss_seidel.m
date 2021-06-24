
function [ x, k ] = gauss_seidel( A, b, x0, tol )
    n = size(x0,1);
    k = 0;
    r_init = norm(b-A*x0);
    
    while ( norm(b-A*x0)/r_init > tol )
        x_old = x0;

        for i=1:n

            sigma = 0;

            for j = 1:i-1
                    sigma = sigma + A(i,j) * x0(j);
            end

            for j = i+1:n
                    sigma = sigma  +A(i,j) * x_old(j);
            end

            x0(i) = (1/A(i,i)) * (b(i)-sigma);
        end

        k = k + 1;
    end
    x = x0;
end