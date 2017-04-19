#!/bin/bash

f=$HOME/sara/new/25.avi

export px=42 py=33 # percentage to crop from every edge
./avi2bov bov "$f"
