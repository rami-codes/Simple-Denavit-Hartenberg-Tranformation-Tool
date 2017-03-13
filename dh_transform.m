function [T] = dh_transform(a, alpha, d, theta, standard_dh)
% dh_transform computes the Denavit-Hartenberg transformation matrix
% Given:
%   a (also written as 'r') - distance between origin(i) and origin(i-1)
%                             about z(i-1)
%
%   alpha(?) - angle from z(i-1) to z(i) about x(i)
%
%   d - the link offset betwen origin(i) with respect to origin(i-1)
%     along z(i-1)
%
%   theta (?) - joint angle between from x(i-1) to x(i) about z(i-1)
%
%
%
%   standard_dh - uses standard DH convention if 1 or if this
%                       parameter is not provided. Uses modified DH
%                       if this value is 0
% OR given:
%           a = DH parameter matrix
%           i.e. for SCARA manipulator a will look like as follows
%           syms q1 q2 d3 q4 a1 a2
%           a =         [ 0             0            0          q1;
%                        a1             0            0          q2;
%                        a2             0            -d3        0 ;
%                        0              0            0          q4];
%
%

if (nargin <= 2)
    if (nargin == 1)
        standard_dh = 1;
    else
        standard_dh = alpha;
    end
    
    dh_parameter_matrix = a;
    for row = 1:size(dh_parameter_matrix,1)
        dh_row = dh_parameter_matrix(row,:);
        a = dh_row(1);
        alpha = dh_row(2);
        d = dh_row(3);
        theta = dh_row(4);
        T(:,:,row) = dh_transform(a, alpha, d, theta, standard_dh);
    end
    
    if (isa(T,'sym'))
        T_out = sym(eye(4,4));
    else  
         T_out = eye(4,4);
    end
    
    for i=1:size(T,3)
            T_out = T_out * T(:,:,i);
    end
    T = T_out;

        
else if (nargin >= 4)
            if (nargin < 5)
                standard_dh = 1;
            end
            if standard_dh  % Standard DH convention computation
                T = [cos(theta)  -sin(theta)*cos(alpha)  sin(theta)*sin(alpha) a*cos(theta);
                    sin(theta)   cos(theta)*cos(alpha)   -cos(theta)*sin(alpha) a*sin(theta);
                    0          sin(alpha)               cos(alpha)            d;
                    0          0                        0                     1];
            else  % Modified DH convention computation
                T = [cos(theta)  -sin(theta)  0  a;
                    sin(theta)*cos(alpha) cos(theta)*cos(alpha) -sin(alpha) -d*sin(alpha);
                    sin(theta)*sin(alpha) cos(theta)*sin(alpha) cos(alpha) d*cos(alpha);
                    0   0   0   1];
            end
        end
        
    end

