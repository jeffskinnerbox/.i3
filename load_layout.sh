#!/bin/bash

# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      0.3.0
#
# DESCRIPTION:
#   i3 execution file to help with debugging
#
#   Please see http://i3wm.org/docs/userguide.html for a complete reference!
#
# NOTE:
#

# First we append the saved layout of workspace N to workspace M
i3-msg "workspace test-2; append_layout ~/.i3/workspace-4.json"

# And finally we fill the containers with the programs they had
(gnome-terminal &)
(gnome-terminal &)
(google-chrome &)

