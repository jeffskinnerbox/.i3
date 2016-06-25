#!/bin/bash

# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      0.2.0
#
# DESCRIPTION:
#   i3 execution file to help with debugging
#
#   Please see http://i3wm.org/docs/userguide.html for a complete reference!
#
# NOTE:
#

export VISUAL=vim               # default visual editor for i3 window manager
export TERMINAL=gnome-terminal  # default terminal for i3 window manager
export PAGER=pg                 # default pager for i3 window manager

MESSPATH="~/.i3"
MESSFILE="i3.log"
OPTIONS=""

# Parse command line options
USAGE="Usage: `basename $0` [-h] [-v] [-d]"
while getopts hvd OPT; do
    case "$OPT" in
        h)
            # print usage message and terminate
            echo $USAGE
            exit 0
            ;;
        v)
            # enable verbose output and all levels of debug output
            OPTIONS="-V -d all"
            ;;
        d)
            # date & time stamp log file name
            MESSFILE="i3-$(date +'%F-%k-%M-%S').log"
            ;;
        \?)
            # getopts issues an error message, print usage message and terminate
            echo $USAGE >&2
            exit 1
            ;;
    esac
done

# i3 message logging
#exec /usr/bin/i3 > ~/.i3/i3-$(date +'%F-%k-%M-%S').log 2>&1

# enable verbose output and all levels of debug output
#exec /usr/bin/i3 -V -d all > ~/.i3/i3-$(date +'%F-%k-%M-%S').log 2>&1

exec /usr/bin/i3 $OPTIONS $MESSPATH/$MESSFILE 2>&1
