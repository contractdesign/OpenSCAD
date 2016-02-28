
// independent parameters
n_leafs = 13;
ripple = 0.1;
thickness=5;
w = 10;
r_min=70;
ang = 5;
num_layers=5;
n_p = 100;

// derived parameters
r_max = r_min + 16*w;


function radius( r_avg, f, n, ang ) = r_avg*(1 + f*sin(n*ang));

function f_sin_poly( ang, r_avg, f, n ) = [ radius(r_avg, f, n, ang)*cos(ang),
radius(r_avg, f, n, ang)*sin(ang) ];


l_points = [for(i=[0:n_p]) f_sin_poly(i*360/n_p, r_min, ripple, n_leafs)];



module ring(t, r) {
	linear_extrude(height=t) scale(r/70) polygon( points=l_points );
}

module hollow_ring(t, r, w) {
	difference() {
		ring(t, r+w);
		ring(t, r);
	}
}


ring(thickness, r_min);

for( i=[1:num_layers] )
	rotate(ang*i) translate([0,0,i*thickness]) hollow_ring(thickness,r_min+(i-1)*w,w);



