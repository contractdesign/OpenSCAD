
side = 8; // [mm] side of a cube
off = side*2/3;  // [mm] offset between cubes
w = 2;    // [mm]  thickness
num_cubes=5;  // [#] number of interlocking cubes


module cubeWidth(side, w) {
    difference() {
    cube( [side+w/2, side+w/2, side+w/2], center=true );
        union() {
            cube( [side-w/2, side-w/2, side+w/2], center=true );
            cube( [side+w/2, side-w/2, side-w/2], center=true );
            cube( [side-w/2, side+w/2, side-w/2], center=true );
        }
    }
}


module instance() {
rotate( [-45, 0, 0] ) for (i=[0:num_cubes-1]) 
    translate( [i*off,i*off,i*off] ) cubeWidth(side, w);
}

instance();
