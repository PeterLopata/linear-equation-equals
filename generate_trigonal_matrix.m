function [ A ] = generate_trigonal_matrix(n)
    range = [1 50];
    A = full(gallery('tridiag', n, randi(range, 1, n-1), randi(range, 1, n), randi(range, 1, n-1)));
end