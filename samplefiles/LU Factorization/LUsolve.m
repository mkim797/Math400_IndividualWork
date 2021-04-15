function x = LUsolve ( lu, b, pvt )

%LUSOLVE      perform forward and backward substitution to obtain the
%             solution to the linear system Ax = b, where the LU
%             decomposition of the coefficient matrix has previously
%             been determined
%
%     calling sequence:
%             x = LUsolve ( lu, b, pvt )
%             LUsolve ( lu, b, pvt )
%
%     inputs:
%             lu      matrix containing LU decomposition of coefficient
%                     matrix for the linear system - the L matrix in the 
%                     decomposition must consists of 1's along the main  
%                     diagonal together with the strictly lower triangular 
%                     portion of the matrix lu; the U matrix in the 
%                     decomposition must be the upper triangular portion 
%                     of the matrix lu
%             b       right-hand side vector for linear system
%             pvt     vector which indicates the permutation of the rows
%                     performed during the LU decomposition of the 
%                     coefficient matrix
%
%     output:
%             x       solution vector
%
%     NOTE:
%             the system Ax = b can be solved by first applying LUfactor
%             to the coefficient matrix A and then applying LUsolve once
%             for each right-hand side vector b
%

[nrow,ncol] = size ( lu );

%
%   forward substitution
%

z(1) = b(pvt(1));
for i = 2 : nrow
    z(i) = b(pvt(i)) - sum ( z(1:i-1) .* lu(pvt(i), 1:i-1) );
end

%
%   back substitution
%

x(nrow) = z(nrow) / lu(pvt(nrow), nrow);
for i = nrow - 1 : -1 : 1
    x(i) = ( z(i) - sum ( x(i+1:nrow) .* lu(pvt(i), i+1:nrow) ) ) / lu(pvt(i),i);
end
