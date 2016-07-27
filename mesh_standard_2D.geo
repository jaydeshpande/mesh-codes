// Gmsh project created on Fri Jul 08 10:19:14 2016
// This program is to create standard enclosure CFD meshes
width = 0.65; // almost 50 inches
height = 2.6; // almost 100 inches
coild = 0.7; // found out subtracting the clearances
lv = 0.3; // louvre height approx equal to wehat saw last year
topcl = 0.2; // louvre clearance approx equal to what saw last year
sidecl = 0.3; // approx equal to about 14 in
nearg = coild/20; //near grid size for the coil
farg = coild/10; //far grid size for rest of the enclosure
celldepth = sidecl/2; // cell depth along Z direction
extremeg = coild; // at the edge of the bounding box of the external environment
room = 11; // far end of the room where the environmental effects don't create problems
//    (-_-)   here begins the serious stuff

// create outer enclosure box
ce = 0; // counter for the number of points
pts[] = {}; // array to store all the points and their point numbers
Point(ce++) = {width,0,0,nearg};pts[]+=ce;
Point(ce++) = {room,0,0,extremeg};pts[]+=ce;
Point(ce++) = {room,room,0,extremeg};pts[]+=ce;
Point(ce++) = {0,room,0,extremeg};pts[]+=ce;
Point(ce++) = {0,height,0,farg};pts[]+=ce;
Point(ce++) = {width,height,0,nearg};pts[]+=ce;
Point(ce++) = {width,height-(topcl),0,nearg};pts[]+=ce;
Point(ce++) = {width,height-(topcl+lv),0,nearg};pts[]+=ce;
Point(ce++) = {width,topcl+lv,0,nearg};pts[]+=ce;
Point(ce++) = {width,topcl,0,nearg};pts[]+=ce;
Point(ce++) = {0,0,0,farg};pts[]+=ce;
Point(ce++) = {0,sidecl,0,nearg};pts[]+=ce;
Point(ce++) = {0,height-sidecl,0,nearg};pts[]+=ce;
Point(ce++) = {coild/2,height-sidecl,0,nearg};pts[]+=ce;
Point(ce++) = {coild/2,sidecl,0,nearg};pts[]+=ce;
Line(1) = {11, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 13};
Line(5) = {13, 12};
Line(6) = {12, 11};
Line(7) = {13, 14};
Line(8) = {14, 15};
Line(9) = {15, 12};
Line(10) = {5, 6};
Line(11) = {6, 7};
Line(12) = {8, 9};
Line(13) = {10, 1};
Line Loop(14) = {4, 7, 8, 9, 6, 1, 2, 3};
Plane Surface(15) = {14};
Line Loop(16) = {5, -9, -8, -7};
Plane Surface(17) = {16};
