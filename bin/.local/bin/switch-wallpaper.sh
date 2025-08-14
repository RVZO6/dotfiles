#!/bin/bash

# Set wallpaper
if [ -n "$1" ]; then
    swww img "$1" --transition-type center
fi

# Restart walker
pkill walker
walker --gapplication-service &
