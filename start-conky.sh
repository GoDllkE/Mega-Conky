#!/bin/bash
# -------------------------------------------------------- #
# Script to run the Mega-Conky
# Version 1.00-0
# -------------------------------------------------------- #
killall conky
conky -c "$HOME/.conky/Mega-Conky/conkyrc" &
