// Gmsh project created on Fri Jul 08 10:19:14 2016
// This program is to create standard enclosure CFD meshes
width = 0.65; // almost 50 inches
height = 2.6; // almost 100 inches
coild = 0.7; // found out subtracting the clearances
lv = 0.3; // louvre height approx equal to wehat saw last year
topcl = 0.2; // louvre clearance approx equal to what saw last year
sidecl = 0.3; // approx equal to about 14 in
insert = 0.15; // beveled inlet
nearg = coild/100; //near grid size for the coil
farg = coild/10; //far grid size for rest of the enclosure
celldepth = sidecl/2; // cell depth along Z direction
extremeg = coild; // at the edge of the bounding box of the external environment
room = 11; // far end of the room where the environmental effects don't create problems
//    (-_-)   here begins the serious stuff

// create outer enclosure box
ce = 0; // counter for the number of points
pts[] = {}; // array to store all the points and their point numbers
Point(ce++) = {width-insert,0,0,nearg};pts[]+=ce;
Point(ce++) = {room,0,0,extremeg};pts[]+=ce;
Point(ce++) = {room,room,0,extremeg};pts[]+=ce;
Point(ce++) = {0,room,0,extremeg};pts[]+=ce;
Point(ce++) = {0,height,0,farg};pts[]+=ce;
Point(ce++) = {width,height,0,nearg};pts[]+=ce;
Point(ce++) = {width,height-(topcl),0,nearg};pts[]+=ce;
Point(ce++) = {width,height-(topcl+lv),0,nearg};pts[]+=ce;
Point(ce++) = {width,topcl+lv,0,nearg};pts[]+=ce;
Point(ce++) = {width,topcl,0,nearg};pts[]+=ce;

Line(ce++) = {pts[0],pts[1]};
Line(ce++) = {pts[1],pts[2]};
Line(ce++) = {pts[2],pts[3]};
Line(ce++) = {pts[3],pts[4]};
Line(ce++) = {pts[4],pts[5]};
Line(ce++) = {pts[5],pts[6]};
Line(ce++) = {pts[6],pts[7]};
Line(ce++) = {pts[7],pts[8]};
Line(ce++) = {pts[8],pts[9]};
Line(ce++) = {pts[9],pts[0]};
Line Loop(21) = {14, 15, 16, 17, 18, 19, 20, 11, 12, 13};
Plane Surface(22) = {21};
Point(ce++) = {0,0,0,farg};pts[]+=ce;
Point(ce++) = {0,sidecl,0,nearg};pts[]+=ce;
Point(ce++) = {0,height-sidecl,0,nearg};pts[]+=ce;
Point(ce++) = {coild/2,height-sidecl,0,nearg};pts[]+=ce;
Point(ce++) = {coild/2,sidecl,0,nearg};pts[]+=ce;
Line(23) = {1, 21};
Line(24) = {21, 22};
Line(25) = {22, 25};
Line(26) = {25, 24};
Line(27) = {24, 23};
Line(28) = {23, 5};
Line Loop(29) = {26, 27, 28, 15, 16, 17, 18, 19, 20, 23, 24, 25};
Plane Surface(30) = {29};
Extrude {0, 0, celldepth} {
  Surface{22, 30};
	Layers{1};
	Recombine;
}
Physical Surface("inlet") = {69};
Physical Surface("outlet") = {57};
Physical Surface("enclosure") = {61, 65, 49, 53};
Physical Surface("coil") = {143, 99, 103};
Physical Surface("symmetry") = {139, 107, 45, 77, 81};
Physical Surface("bottom") = {73, 135};
Physical Surface("topandbottom") = {82, 22, 144, 30};
Physical Volume("air") = {1, 2};
