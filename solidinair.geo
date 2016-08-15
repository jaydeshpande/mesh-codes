// Gmsh project created on Tue Jul 26 09:05:04 2016
r = 5;
r2 = 0.2;
ce = 0;
pts[]={};
nearg = r2/50;
farg = r2/3;
Point(ce++) = {0,0,0,farg};pts[]+=ce;
Point(ce++) = {r,0,0,farg};pts[]+=ce;
Point(ce++) = {r,r,0,farg};pts[]+=ce;
Point(ce++) = {0,r,0,farg};pts[]+=ce;
Point(ce++) = {(0.5*r)-(0.5*r2),(0.5*r)-(0.5*r2),0,nearg};pts[]+=ce;
Point(ce++) = {(0.5*r)+(0.5*r2),(0.5*r)-(0.5*r2),0,nearg};pts[]+=ce;
Point(ce++) = {(0.5*r)+(0.5*r2),(0.5*r)+(0.5*r2),0,nearg};pts[]+=ce;
Point(ce++) = {(0.5*r)-(0.5*r2),(0.5*r)+(0.5*r2),0,nearg};pts[]+=ce;
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 5};
Line Loop(9) = {3, 4, 1, 2};
Line Loop(10) = {7, 8, 5, 6};
Plane Surface(11) = {9, 10};
Plane Surface(12) = {10};
Recombine Surface {11};
Recombine Surface {12};
air[]=Extrude {0, 0, -0.1} {
  Surface{11};
  Layers{1};
  Recombine;
};
solid[]=Extrude {0, 0, -0.1} {
  Surface{12};
  Layers{1};
  Recombine;
};

Physical Volume('air') = {air[1]};
Physical Volume('solid') = {solid[1]};
Physical Surface("empty_air") = {11, 54};
Physical Surface("empty_solid") = {12, 76};
Physical Surface("wall") = {37, 25, 29, 33};
