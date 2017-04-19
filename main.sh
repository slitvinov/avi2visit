#!/bin/bash

f=$HOME/sara/new/25.avi

avi2tiff tiff $f

px=42 py=33 # percentege to crop from every edge
croptiff $px $py tiff/*
fliptiff         tiff/*

tiff2pgm pgm     tiff/*
pgm2bov  bov     pgm/*
