#!/usr/bin/env bash
fmt < "$1" | convert -size 800x1200 xc:white -font "DejaVu-Sans-Condensed" -pointsize 28 -fill black -annotate +80+80 "@-" -bordercolor "#FFF" -border 10 +repage "$2"
optipng "$2"