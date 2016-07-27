MeshSize = 0.1;

Point(1) = { 0.0 , 0.0 , 0.0 , MeshSize}; 		//origin
Point(2) = { 0.0 , 0.5 , 0.0 , MeshSize};
Point(3) = { 0.5 , 0.0 , 0.0 , MeshSize};
Point(4) = { 0.0 ,-0.5 , 0.0 , MeshSize};
Point(5) = {-0.5 , 0.0 , 0.0 , MeshSize};

Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};

Line Loop(1) = {4, 1, 2, 3};

Plane Surface(1) = {1};

Extrude {0, 0, -10}
{
  Surface{1};
	Layers{10};
	Recombine;
}

Extrude {{0, 1, 0}, {2.5, 0, -10}, -Pi/2} 
{
  Surface{26};
  Layers{10};
	Recombine;
}

Extrude {{0, 1, 0}, {2.5, 0, -10}, -Pi/2} 
{
  Surface{48};
  Layers{10};
	Recombine;
}

Extrude {0, 0, 10}
{
  Surface{70};
	Layers{10};
	Recombine;
}

Physical Volume ("Fluid")  = {1,2,3,4} ;

Physical Surface("Inlet") = {1};
Physical Surface("Outlet") = {92};
