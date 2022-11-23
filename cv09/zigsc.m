% This function implements a zigzag scan of input square matrix data.
%
% Syntax:  [B] = zigsc(A,dim)
%
% Inputs:
%    A - Input square matrix data.
%    dim - Input matrix dimension.
%
% Output:
%    B - Zigzag scanned 1D data array.
%
% Example: 
%    A = [1,2,6,7;3,5,8,13;4,9,12,14;10,11,15,16];
%    dim = 4;
%    B = [1:16];
%
% Author: Maryam Sadeghi
% May 2020.
%-------------------- BEGIN OF CODE ---------------------
function [B] = zigsc(A,dim)
v = ones(1,dim);
C5 = 0;
for i = 1:2*dim-1
    C1 = diag(v,dim-i);
    C2 = flip(C1(1:dim,1:dim),2);
    C3 = sum(C2.*A);
    if i <= dim
       C4 = C3(1:i);
    else
       C4 = C3(i-(dim-1):dim); 
    end 
    if mod(i,2) == 0
       C4 = flip(C4);
    end
    C5 = cat(2,C5, C4);
end
B = C5(2:end);                                      
%-------------------- END OF CODE ---------------------

