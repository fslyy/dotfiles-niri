#!/usr/bin/env bash

tmpbg='/tmp/screen.png'

source ~/.cache/hellwal/variables.sh

grim "$tmpbg"

PARAM=(--font "FiraCode Nerd Font" --font-size 12 --indicator-radius 100 --indicator-thickness 15 --inside-color 00000000 --inside-clear-color $foreground --inside-ver-color $color1 --inside-wrong-color $color2 --key-hl-color $color1)

magick "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"

#magick "$tmpbg" -gravity center -composite "$tmpbg"

swaylock "${PARAM[@]}" -i "$tmpbg"

