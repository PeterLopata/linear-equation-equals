function [ A ] = generate_thing_matrix(n)
    A = full(sprand(n,n,10));
end