

// https://www.pinterest.com/pin/515943701044235619/

// TODO: check in library
include <../lib/hex_cell.scad>

r = 0.5;
p = 0.1;
h = 0.2;


hex_w = r*sqrt(3)/2;
hex_h = r*2;

//1
hex_cell( r, p, h );
//2
translate( [r*sqrt(3)/2, -3*r/2] ) hex_cell( r, p, h );
translate( [3*r*sqrt(3)/2, -3*r/2] ) hex_cell( r, p, h );

//2.5
translate( [r*sqrt(3), -4*r/2] ) hex_cell( r, p, h );
translate( [2*r*sqrt(3), -4*r/2] ) hex_cell( r, p, h );


//3
translate( [2*r*sqrt(3)/2, -2*3*r/2] ) hex_cell( r, p, h );
translate( [4*r*sqrt(3)/2, -2*3*r/2] ) hex_cell( r, p, h );

//3.5
// TODO same x offset as '2.5' but different 'y'...
translate( [1.5*r*sqrt(3), -7*r/2] ) hex_cell( r, p, h );



//4
translate( [r*sqrt(3)/2, -3*3*r/2] ) hex_cell( r, p, h );
translate( [3*r*sqrt(3)/2, -3*3*r/2] ) hex_cell( r, p, h );
//5
translate( [2*r*sqrt(3)/2, -4*3*r/2] ) hex_cell( r, p, h );
//6
translate( [r*sqrt(3)/2, -3*3*r/2] ) hex_cell( r, p, h );

