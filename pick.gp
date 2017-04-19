set term x11
set macro
set size ratio -1
set key off
set parametric

xc = 100; yc = 100 # center
r  = 50 # radius
s = 10 # step
a = r; b = r; # axis of the frame

# set print "p.conf"

# right-left
bind "h" "xc = xc - s; @p"
bind "l" "xc = xc + s; @p"

# up-down
bind "j" "yc = yc - s; @p"
bind "k" "yc = yc + s; @p"

# +/- circle
bind "r" "r = r - s; @p"
bind "R" "r = r + s; @p"

# +/- step size
bind "+" "s = s + 1            ; @p"
bind "-" "s = s > 1 ? s - 1 : s; @p"

# +/- frame
bind "f" "a = a - s; b = b - s; @p"
bind "F" "a = a + s; b = b + s; @p"

# print
bind "p" "print xc, yc, r, a, b"

# image
i = '"test_data/p.png" binary filetype=png w rgbimage'

# circle
c = 'r*sin(t) + xc, r*cos(t) + yc'

# superellipse (frame)
n = 30 # exponent
cos_sign(t) = sgn(cos(t))
sin_sign(t) = sgn(sin(t))
xse0(t)= a * abs(cos(t))**(2./n) * cos_sign(t)
yse0(t)= b * abs(sin(t))**(2./n) * sin_sign(t)
xse(t) = xse0(t) + xc
yse(t) = yse0(t) + yc
se = 'xse(t), yse(t)'

p = 'plot [0:2*pi] @i, @c, @se'

@p
