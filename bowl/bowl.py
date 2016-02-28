from solid import *
from solid.utils import *

# independent parameters
w = 10
r_min = 70


# derived parameters

r_max = r_min + 16*w


def f_sin_poly( ang, r_avg, f, n ):
    r = r_avg*(1 + f*sin(n*ang))
    return [ r*cos(ang), r*sin(ang) ]


n_p = 100


def sin_poly( r_avg, f, n ):
    l_points = [ f_sin_poly(i*2*pi/n_p, r_min, 0.1, 8) for i in range(0, n_p) ]
    return polygon(points=l_points)


d = sin_poly( r_min + w, 0.1, 10 ) + sin_poly( r_min, 0.1, 10 );


print scad_render( d)
