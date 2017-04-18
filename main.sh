#!/bin/bash

copy () (d=$HOME/sara/new; cp $d/25.avi v.avi )
mdirs ()   { mkdir -p tiff; }
avi2tiff () { convert v.avi -type truecolor tiff/'%04d'.tiff; }
# [a]wk [e]xpression: ae 1.0+2.0 returns 3.0
ae() ( s='BEGIN {print '"$@"'}'; awk "$s" )
set_crop () { # uses `px' and `py' to set `lx' and `ly'
    local f=tiff/0000.tiff
    lx=`convert $f -format '%w' info:`
    ly=`convert $f -format '%h' info:`

    dx=`ae int '(' $px/100*$lx ')'`
    dy=`ae int '(' $py/100*$ly ')'`

    lx=`ae $lx-2*$dx`
    ly=`ae $ly-2*$dy`
}

run_crop() {
    for f in tiff/*.tiff; do
	convert -type truecolor -crop  ${lx}x${ly}+${dx}+${dy} +repage "$f" tmp.tiff &&
	    mv tmp.tiff "$f"
    done
}

flip() {
    for f in tiff/*.tiff; do
	convert -type truecolor -flip "$f" tmp.tiff &&
	    mv tmp.tiff "$f"
    done
}

copy
mdirs
avi2tiff

px=40 py=30
set_crop # set parameters of the crop
run_crop
flip

feh i.tiff
