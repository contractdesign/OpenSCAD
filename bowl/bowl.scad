/*
ornamental bowl created using a series of rotate sinusoidal rings

created with OpenSCAD version 2015.03-1

*/



// independent parameters
n_leafs = 13;   // number of leaves
ripple = 0.1;   // amount of sinusoidal ripple
thickness=5;    // thickness of each ring
w = 10;        // width of each ring
r_min=70;      // radius of innner ring
ang = 5;        // offset angle
num_layers=5;   // number of rings.  the base is not counted
n_p = 100;     // number of points to evaluate

// derived parameters
r_max = r_min + 16*w;


// helper function
function radius( r_avg, f, n, ang ) = r_avg*(1 + f*sin(n*ang));

function f_sin_poly( ang, r_avg, f, n ) = [ radius(r_avg, f, n, ang)*cos(ang),
radius(r_avg, f, n, ang)*sin(ang) ];


l_points = [for(i=[0:n_p]) f_sin_poly(i*360/n_p, r_min, ripple, n_leafs)];

// creates a (non-hollow) sinusoidal ring
module ring(t, r) {
	linear_extrude(height=t) scale(r/70) polygon( points=l_points );
}

// sinusoidal ring.  uses ring() defined above
module hollow_ring(t, r, w) {
	difference() {
		ring(t, r+w);
		ring(t, r);
	}
}


// base layer (not hollow)
ring(thickness, r_min);

// additional rings
for( i=[1:num_layers] )
	rotate(ang*i) translate([0,0,i*thickness]) hollow_ring(thickness,r_min+(i-1)*w,w);



