
/*

create the Harry Potter symbol


*/


//--------------------------------------------------------------------------------
// independent parameters
s=25;          // [mm] the length of the side of the equilateral triangle
w=1;           // [mm] the width of each side
thickness=3;   // [mm] z-dimension
r_earring = 2; // [mm] radius of ring to attach earring

$fn=100;       // # of edges used to approximate circle

//--------------------------------------------------------------------------------

module ring(r, w) {
	difference() {
		circle( r=r+w/2 );
		circle( r=r-w/2 );
	}
}

module triangle(s) {
	d = s/sqrt(3);
	polygon( [ [0,d], [-s/2,-d/2], [s/2, -d/2]] );
}


module bar(s, w) {
	d = s/sqrt(3);
	polygon( [[w/2,d], [w/2,-d/2], [-w/2,-d/2], [-w/2,d] ] );

}

/*
The reference point for all of the following shapes is the center of the circle.
*/

module hp_symbol() {
	r = s/2/sqrt(3);
	union() {
		ring( r, w );

		difference() {
		triangle(s + sqrt(3)*w);
		triangle(s - sqrt(3)*w);
		}

		bar(s,w);

		translate( [0,s*sqrt(3)/3+r_earring,0] ) ring( r_earring, r_earring/2 );
	}
}

linear_extrude(height=thickness, center=true) hp_symbol();




