#!/bin/bash

# br-abnt2 layout 
layout1=br
  # us layout 
layout2=us

if setxkbmap -query | grep "$layout1"; then
  setxkbmap "$layout2"
else
  setxkbmap "$layout1"
fi

