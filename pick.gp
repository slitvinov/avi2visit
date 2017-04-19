set term x11
set macro
set size ratio -1
set key off
set parametric

xc = 500; yc = 500 # center
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
bind "+" "s = s + 1;             print 's = ', s"
bind "-" "s = s > 1 ? s - 1 : s; print 's = ', s"
bind "0" "s = 1;                 print 's = ', s"

# +/- frame
bind "f" "a = a - s; b = b - s; @l; @p"
bind "F" "a = a + s; b = b + s; @l; @p"

# print
bind "p" "print xc, yc, r, a, b"

# image
i = '"test_data/p.avs" binary filetype=auto w rgbimage'

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
p = '@l; plot [0:2*pi] @i, @c, @se'

# limits
l = 'de = 6*a/5; set xrange [xc-de:xc+de]; set yrange [yc-de:yc+de]'
@p

# 256 112 16 96 96
# 641 328 16 106 106