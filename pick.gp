set term x11
set macro
set size ratio -1
set key off

xc = 100
yc = 100
r  = 50

set parametric
set print "p.conf"

s = 10 # step
bind "h" "xc = xc - s; @p"
bind "l" "xc = xc + s; @p"

bind "j" "yc = yc - s; @p"
bind "k" "yc = yc + s; @p"

bind "r" "r = r - s; @p"
bind "R" "r = r + s; @p"

bind "+" "s = s + 1            ; @p"
bind "-" "s = s > 1 ? s - 1 : s; @p"


bind "p" "print xc, yc, r"

i = '"test_data/p.png" binary filetype=png w rgbimage'
p = 'plot [0:2*pi] @i, r*sin(t) + xc, r*cos(t) + yc'

@p