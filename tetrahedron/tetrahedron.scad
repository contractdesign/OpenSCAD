/*

tetrahedron

*/


side = 15;  // side dimension [mm]
thickness = 2; // line thickness [mm]

$fn=20;



// create a line between two points 'p0' and 'p1' with thickness 't'
module line3D( p0, p1, t ) {
    hull() {
        translate( p0 ) sphere(r=t/2);
        translate( p1 ) sphere(r=t/2);
    }
}


// create a tetrahedron with the specified side length and line thickness
module tetrahedron(s, t) {
    l_points = [
    [ s/2,  s/2,  s/2],
    [ s/2, -s/2, -s/2],
    [-s/2,  s/2, -s/2],
    [-s/2, -s/2,  s/2] ];    
    
    union() {
        line3D( l_points[0], l_points[1], t );
        line3D( l_points[0], l_points[2], t );
        line3D( l_points[0], l_points[3], t );
        line3D( l_points[1], l_points[2], t );
        line3D( l_points[1], l_points[3], t );
        line3D( l_points[2], l_points[3], t );
    }
}


// TODO look into using children()
tetrahedron(side, thickness);
