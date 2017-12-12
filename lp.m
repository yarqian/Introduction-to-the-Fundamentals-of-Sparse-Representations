function x = lp(A, b, tol)
% LP Solve Basis Pursuit via linear programing
%
% Solves the following problem:
%   min_x || x ||_1 s.t. b = Ax
%
% The solution is returned in the vector x.

% Referrence£ºChen, S.S., Donoho, D.L. and Saunders, M.A., 2001. Atomic decomposition by basis pursuit. SIAM review, 43(1), pp.129-159.

% Set the options to be used by the linprog solver
% options = optimoptions('linprog','Algorithm','dual-simplex',...
%     'Display','none','OptimalityTolerance',tol);

% TODO: Use Matlab's linprog function to solve the BP problem
% Write your code here... x = ????;
    Phi = A;
    [b_rows,b_columns] = size(b);    
    if b_rows<b_columns    
        b = b';%s should be a column vector    
    end   
    p = size(Phi,2);  
    %according to section 3.1 of the reference  
    c = ones(2*p,1);  
    A = [Phi,-Phi];  
    lb = zeros(2*p,1);  
    x0 = linprog(c,[],[],A,b,lb);  
    alpha = x0(1:p) - x0(p+1:2*p);  
x = alpha;

end
