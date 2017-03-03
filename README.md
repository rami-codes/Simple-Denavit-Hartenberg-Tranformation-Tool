# Simple-Denavit-Hartenberg-Tranformation-Tool
Simple __Matlab__ function to compute the  transformation matrix given __standard or modified__ Denavit Hartenberg parameters.  
Check out the [Wikipedia DH parameters](https://en.wikipedia.org/wiki/Denavit%E2%80%93Hartenberg_parameters) page for more information

## Function definition  


_function [T] = dh_transform(a, alpha, d, theta, standard_dh)_  

dh_transform computes the Denavit-Hartenberg transformation matrix  




## Case 1 (Given single DH parameters)
 * a (also written as 'r') - distance between origin<sub>i</sub> and origin<sub>i-1</sub> about z<sub>i-1</sub>
 * alpha(α) - angle from z<sub>i-1</sub> to z<sub>i</sub> about x<sub>i</sub>
 * d - the link offset betwen origin<sub>i</sub> with respect to origin<sub>i-1</sub> along z<sub>i-1</sub>
 * theta (θ) - joint angle between from x<sub>i-1</sub> to x<sub>i</sub> about z<sub>i-1</sub>
 * standard_dh - uses standard DH convention if 1 or if this parameter is not provided. Uses modified DH if this value is 0.
 
## Case 2 (Given DH parameter matrix)
_a_ = DH parameter matrix, _alpha_ = standard_dh  
 i.e. for SCARA manipulator _a_ will look like as follows  
 
     syms q1 q2 d3 q4 a1 a2  
     
     a =         [ 0             0            0          q1;  
     
                  a1             0            0          q2;  

                  a2             0            -d3        0 ;  

                  0              0            0          q4];


