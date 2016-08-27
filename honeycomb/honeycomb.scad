


module hex_cell( r, p, h ) {
    l_points = [for (ang=[0:5]) [r*cos(ang*60 + 30), r*sin(ang*60 + 30)]];

    linear_extrude( height=h ) {
        difference() {
            polygon( l_points );
            scale( [p, p, p] ) polygon( l_points );
        }
    }
}


module hex_row( r, p, h, n ) {
    union() {
        for (i=[0:n]) {
            translate( [0, i*r*3] ) hex_cell( r, p, h );
        }
    }
}

module hex_row_pair( r, p, h, n ) {
    union() {
        hex_row( r, p, h, n );
        translate( [sqrt(3)*r/2, 1.5*r] ) hex_row( r, p, h, n );
    }
}



r = 0.5;
p = 0.9;
h = 0.5;
m = 1;
n = 2;
union() {
    for (row=[0:n]) {
        translate( [2*row*sqrt(3)*r/2, 0] ) hex_row_pair(r, p, h, m);
    }
 }



