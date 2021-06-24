% NLA1 - projekt
%
% Jmeno: Peter Kop·Ë
% Login: KOP0186
% Datum: 13. 5. 2021

count = 250;
RandomMatrix = generate_random_matrix(count);
ThingMatrix = generate_thing_matrix(count);
TrigonalMatrix = generate_trigonal_matrix(count);
x0 = zeros(count, 1);
b = rand(count, 1);

tic; 
[LowerRandom, UpperRandom, PivotRandom] = lu_decomposition( RandomMatrix ); 
Pb = PivotRandom * b; 
y =  fsubst( LowerRandom, Pb );
x =  bsubst( UpperRandom, y ); 
T1 = toc;

tic; 
[LowerThing, UpperThing, PivotThing] = lu_decomposition( ThingMatrix ); 
Pb = PivotThing * b; 
y =  fsubst( LowerThing, Pb ); 
x =  bsubst( UpperThing, y ); 
T2 = toc;

tic; 
[LowerTrigonal, UpperTrigonal, PivotTrigonal] = lu_decomposition( TrigonalMatrix ); 
Pb = PivotTrigonal * b; 
y =  fsubst( LowerTrigonal, Pb ); 
x =  bsubst( UpperTrigonal, y );
T3 = toc;

fprintf("LU decomposition times for random, thing and trigonal matrix:\n");
disp( [ T1, T2, T3 ] );

tic; [xRandom] = gauss_seidel( RandomMatrix, b, x0, 1e-8 ); T1 = toc;
tic; [xThing] = gauss_seidel( ThingMatrix, b, x0, 1e-8 ); T2 = toc;
tic; [xTrigonal] = gauss_seidel( TrigonalMatrix, b, x0, 1e-8 ); T3 = toc;

fprintf("Gauss Seidel times for random, thing and trigonal matrix:\n");
disp( [  T1, T2, T3 ] );

tic;  xMatlabRandom = RandomMatrix \ b; T1 = toc;
tic;  xMatlabThing = ThingMatrix \ b; T2 = toc;
tic;  xmatlabTrigonal = TrigonalMatrix \ b; T3 = toc;

fprintf("Matlab times for random, thing and trigonal matrix:\n");
disp( [  T1, T2, T3 ] );

