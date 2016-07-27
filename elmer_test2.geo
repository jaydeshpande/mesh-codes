width = 0.2;
height = 0.2;
space = 0.4;
room = space+space+width;
nearg = 0.01;
extremeg = 0.1;
ce = 0; // counter for the number of points
pts[] = {}; // array to store all the points and their point numbers
Point(ce++) = {0,0,0,nearg};pts[]+=ce;
Point(ce++) = {space,0,0,nearg};pts[]+=ce;
Point(ce++) = {space,width,0,nearg};pts[]+=ce;
Point(ce++) = {0,width,0,nearg};pts[]+=ce;
Point(ce++) = {0,2*width,0,nearg};pts[]+=ce;
Point(ce++) = {space,2*width,0,nearg};pts[]+=ce;
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {4, 5};
Line(6) = {5, 6};
Line(7) = {6, 3};
Line Loop(8) = {6, 7, 3, 5};
Plane Surface(9) = {8};
Line Loop(10) = {3, 4, 1, 2};
Plane Surface(11) = {10};
Transfinite Line {5} = 22 Using Progression 1.2;
Transfinite Line {7} = 22 Using Progression 0.8333333;
Recombine Surface {9};
Transfinite Surface {9};
Transfinite Line {4} = 22 Using Progression 1.2;
Transfinite Line {2} = 22 Using Progression 0.833333;
Transfinite Surface {11};
Recombine Surface {11};
Physical Surface("air") = {9};
Physical Surface("aluminium") = {11};
