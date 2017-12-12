function x = omp(A, b, k)
% OMP Solve the P0 problem via OMP
%
% Solves the following problem:
%   min_x ||b - Ax||_2^2 s.t. ||x||_0 <= k
%
% The solution is returned in the vector x
% Initialize the vector x
x = zeros(size(A,2),1);
p=1;
res = b - A*x;
S = [];
xk = [];

% TODO: Implement the OMP algorithm
% Write you code here... x = ????;
while p<=k
    [~,ind] = max(abs(res'*A));
    S = [S ind];
    subA = A(:,S);
    xk = subA\b;
    res = b - subA*xk;
    p = p+1;
end
x(S) = xk;
end

