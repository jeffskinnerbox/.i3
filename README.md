<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.5.0
-->

Dropbox
exec dropbox start
http://hiankun.blogspot.com/2013/05/i3-tiling-window-manager.html


# i3 Window Manager
The i3 [tiling window manager][01] is a nice modern tiling window manager that
works within X Window under GNU/Linux/BSD operating systems,
and primarily targeted at advanced users and developers.
It supports tiling, stacking, tabs, virtual desktops, and multiple monitors.
You can do almost everything from the keyboard, or mix up keyboard and mouse.
It's well documented and real simple to modify and tinker with.
With extremely easy to remember keybindings, using i3 is extremely enjoyable,
even without the need for a mouse.

<a href="https://i3wm.org/">
    <img class="img-rounded" style="margin: 0px 8px; float: left" title="i3 is a tiling window manager designed for X11  and runs on all version of Linux. It supports tiling, stacking, and tabbing layouts, which it handles dynamically. Configuration is achieved via plain text file and extending i3 is possible using its Unix domain socket and JSON based IPC interface from many programming languages." alt="i3-logo" src="https://upload.wikimedia.org/wikipedia/commons/8/87/I3_window_manager_logo.png" width="100" height="100" />
</a>
For quite some time I had started feeling all the panels,
the system menus, the starters, the status applets, desktop background,
drag-drop functionality, border decoration and animations
which Desktop environments provide to be useless.
These functionalities consumed a lot of resources, slowing down my system,
and take up screen space.
I could do away with all this functionality.
I just needed a [Window Manager][07] without all the [Window Desktop][08] crap.
And although desktop environments can be pretty and fluid,
you'll discover just how simple to use and fast
your computer can become by use a window manager like i3.

A [Tiling Window Manager][09] can increase your efficiency by providing a lot of keyboard shortcuts.
They make you less dependent on mouse.
It is hard to get used to at first but you get used to it eventually.
They are heavily customizable.
To start with, you can provide your own keyboard shortcuts
but essentially you can make your own environment.

There are many tiling window managers available out there but I chose i3.
The [i3 tiling window manager][02] is a nice modern tiling window manager
that is open source and very well documented.
It supports tiling, stacking, tabs, virtual desktops, and multiple monitors.
You can do almost everything from the keyboard, or mix up keyboard and mouse.
i3 is highly configruable and not dogmatic about tiling geometry and lets you have it your way.

----

# Relavent Tools and Background

## Tools to Help Discover Key Names and Window Properties
[`xmodmap`][] is a utility for modifying keymaps
and pointer button mappings in X Window.
Use `xmodmap -pm` to get a listing of the the i3 modifiers Mod1 to Mod5.

[`xwininfo`][] is a X Window utility for displaying information
(e.g. location, width, height, geometry, etc.) about windows.
The user has the option of selecting the target window with the mouse
(by clicking any mouse button in the desired window)
or by specifying its window id on the command line with the `-id` option.

Keynames are not always consistent on keyboards,
so you can find the correct keynames with the [`xev`][06] command
(contained in the `x11-utils` package).
Run `xev` with no options, and then press keys to see their names and keycodes.
Here is an example when pushing and releasing the "q" key:

```
$ xev
  .
  .
  .
KeyPress event, serial 32, synthetic NO, window 0x1000001,
    root 0xd4, subw 0x0, time 254041809, (443,89), root:(447,903),
    state 0x0, keycode 24 (keysym 0x71, q), same_screen YES,
    XLookupString gives 1 bytes: (71) "q"
    XmbLookupString gives 1 bytes: (71) "q"
    XFilterEvent returns: False

KeyRelease event, serial 32, synthetic NO, window 0x1000001,
    root 0xd4, subw 0x0, time 254041927, (443,89), root:(447,903),
    state 0x0, keycode 24 (keysym 0x71, q), same_screen YES,
    XLookupString gives 1 bytes: (71) "q"
    XFilterEvent returns: False
  .
  .
  .
```

The [`xprop`][05] utility is for displaying window and font properties in an X server.
Information is displayed once a window or
font is selected using the command line arguments
or possibly in the case of a window by clicking on the desired
window.
A list of properties is then given, possibly with formatting information.
Here is an example when I selected a `gnome-terminal` window:

```
$ xprop
_NET_WM_DESKTOP(CARDINAL) = 0
WM_STATE(WM_STATE):
		window state: Normal
		icon window: 0x0
WM_HINTS(WM_HINTS):
		Client accepts input or input focus: True
		Initial state is Normal State.
		bitmap id # to use for icon: 0x1a03a6c
		bitmap id # of mask for icon: 0x1a03a72
		window id # of group leader: 0x1a00001
XdndAware(ATOM) = BITMAP
_NET_WM_OPAQUE_REGION(CARDINAL) = 0, 0, 860, 570
_NET_WM_ICON(CARDINAL) = 	Icon (48 x 48):







	  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
	 ░                                            ░
	 ░                                            ░
	 ░                                            ░
	 ░   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒   ░
	 ░   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒   ░
	 ░   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒   ░
	 ░   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓   ░
	 ░   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓   ░
	 ░   ▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓   ░
	 ░   ▒▒▒▒░   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓   ░
	 ░   ▒▒▒▒░    ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒▓   ░
	 ░   ▒▒▒▒▒▒    ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▒▓   ░
	 ░   ▒▒▒▒▒▒▒░   ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▓   ░
	 ░   ▒▒▒▒▒▒▒▒    ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▒▓   ░
	 ░   ▒▒▒▒▒▒▒    ░▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓   ░
	 ░   ▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓   ░
	 ░   ▓▒▒▒░    ▒▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   ░
	 ░   ▓▒▒▒░  ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   ░
	 ░   ▓▒▓▓▓▒░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   ░
	 ░   ▓▓▓▓▓▓▓▓▓▓▓▓▓        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   ░
	 ░   ▓▓▓▓▓▓▓▓▓▓▓▓▓        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   ░
	 ▒   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   ▒
	 ▒ ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ▒
	 ▒ ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ▒
	 ▒ ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ▒
	 ▒ ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ▒
	 ▒ ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ▒
	 ▒ ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ▒
	 ▒ ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ▒
	 ▒ ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ▒
	 ▒ ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ▒
	 ▒ ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ▒
	 ▒░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░▒
	 ▒░░                                        ░░▒
	 ▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒
	 ▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒
	  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒





WM_WINDOW_ROLE(STRING) = "gnome-terminal-window-24691-208556179-1465440612"
_NET_WM_WINDOW_TYPE(ATOM) = _NET_WM_WINDOW_TYPE_NORMAL
_NET_WM_SYNC_REQUEST_COUNTER(CARDINAL) = 27277930, 27277931
_NET_WM_USER_TIME(CARDINAL) = 221627122
_NET_WM_USER_TIME_WINDOW(WINDOW): window id # 0x1a03a69
WM_CLIENT_LEADER(WINDOW): window id # 0x1a00001
_NET_WM_PID(CARDINAL) = 24691
WM_LOCALE_NAME(STRING) = "en_US.UTF-8"
WM_CLIENT_MACHINE(STRING) = "desktop"
WM_NORMAL_HINTS(WM_SIZE_HINTS):
		program specified minimum size: 34 by 35
		program specified resize increment: 8 by 17
		program specified base size: 2 by 2
		window gravity: NorthWest
WM_PROTOCOLS(ATOM): protocols  WM_DELETE_WINDOW, WM_TAKE_FOCUS, _NET_WM_PING, _NET_WM_SYNC_REQUEST
WM_CLASS(STRING) = "gnome-terminal", "Gnome-terminal"
WM_ICON_NAME(STRING) = "jeff@desktop - /home/jeff"
_NET_WM_ICON_NAME(UTF8_STRING) = "jeff@desktop - /home/jeff"
WM_NAME(STRING) = "jeff@desktop - /home/jeff"
_NET_WM_NAME(UTF8_STRING) = "jeff@desktop - /home/jeff"
```

Only a small amount if this information is relavent.
To print just what is needed,
use this script (applied to the example above):

```bash
$ xprop | grep -E "WM_CLASS|WM_WINDOW_ROLE"
```

## Pango Markup
https://developer.gnome.org/pygtk/stable/pango-markup-language.html

Pango is the core text/font layout engine library used in GNOME applications.
It has extensive support for the different writing systems used throughout the world.

----

# Installing i3
Assuming you are already working in a traditional desktop environment like GNOME,
here is what you should install:

https://fedoramagazine.org/getting-started-i3-window-manager/

```bash
# install i3 and supporting programs
sudo apt-get install i3 i3lock xautolock i3status feh dunst dmenu wmctrl conky x11-utils
```

These are some of the programs and configuration files that will be installed:

* **i3** is the main window manager package.
* **i3lock**  is a screen-lock utility.
* **xautolock** is inactivity timeout/lock utility.
* **i3status** is a utility to generate a string with information to be displayed in the i3bar.
* **feh** is a utility to set a wallpaper.
* **dunst** is a simple notification utility for things like wireless network status.
* **dmenu** is a utility to launch our apps in the i3 desktop.
* **wmctrl** is a utility to query the window manager for information and request actions be taken.
* **conky** is a utility to display information of the system in a awesome way.
* **x11-utils** is a package contains several useful X Window tools (like `xprop` and `xev` which lists properties of windows and the keyboard).

Install i3 and these supporting packages, then log out.
When you log back in, change your window manger to i3
from your [display manager][17] screen (aka login screen).
At least this is what you'll do for Ubuntu.
Other Linux distributions might require different steps to get the new i3 window manager operational.

On its first run, i3 walks you through a simple configuration wizard.
This is the program [`/usr/bin/i3-config-wizard`][18].
It will be execute by i3's default configuration file,
`/etc/i3/config` (see `exec i3-config-wizard` at the end of the file).
So if you wish to rerun this wizard at any time,
just remove your `~/.i3/config` file and the wizard will run at then next start up of i3
or just run `/usr/bin/i3-config-wizard` on the command line to write over your configuration file.

When the wizard executes,
you must decide if you want the wizard to create a `~/.i3/config` configruation file.
Say yes.
Then choose your mod (modifier) key, either the `Win`
(on many keyboards it bears the Windows logo) or `Alt` key.
If you choose the `Alt` keep in mind that you could conflict
with a lot of application keybindings and commands, so choose `Win` is a good option.
If your working on a Chromebook, there is no `Win` key, so you best bet is the `Alt`.

At this point, you can run i3 as your window manager.
What follows will make use of my [i3 dotfile][10] and tailor the setup in a few other ways.

----

# Install the i3 Dotfiles
This [.i3 GitHub repository][10] contains the i3 configuration files
and shell scripts (`config`, `i3status.conf`, etc.)
used to make my i3 window manager useful for my needs.

>This is my i3-config. There are many like it, but this one is mine.
My i3-config is my best friend. It is my life. I must master it as I must master my life.
(See [Full Metal Jacket][04] or [The Rifleman's Creed][03])

To clone this i3 configuration on another system, execute the following:

    cd ~
    git clone https://github.com/jeffskinnerbox/.i3.git
    ln -s ~/.i3/i3status.conf ~/.i3status.conf

With this installed, we now move on to installing i3 itself
and configuring the Linux system to make use of the configuration files.

----

# Setting Up i3

## Corky Workaround
I found that [`conky`][13] has its own expectations when it comes to i3.
Specifically, to get `conky` to appear on the background of the display when using i3,
I have set the `conky` window type to override (`own_window_type override`)
instead of normal.
Problem is, this wouldn't work with my other window managers.
To get around this,
I have to make sure `conky` has the right configuration prior to starting,
but this must occur after the window manager has started so I can detect if i3 is being used.

To solve this, I put the following code in my [`~.xscreenrc`][14] file:

```bash
# place a Conky system monitoring display on the desktop background
# delay so the window manager has time to come up
( sleep 5 ;
if [ "$(wmctrl -m | grep Name | awk '{ print $2 }')" == "i3" ]; then   # check for type of window manager
    cp $HOME/.conky/src/ubuntu-i3-conkyrc $HOME/.conky/conkyrc
else
    cp $HOME/.conky/src/ubuntu-conkyrc $HOME/.conky/conkyrc
fi
conky & ) &
```

This assures that when `conky` is started by the `~/.xscreenrc` file,
the proper conky configuration file is being used for the window manager.
**NOTE:** This works on Ubuntu but not all versions of Linux use `~/.xscreenrc`.
Other Linux versions may require this fix in `~/.xinitrc` or something else.

As an alternative,
you could integrate `conky` more tightly with i3 by doing things like
[using conky to populate the i3 status bar][15].
Also see "[Using conky with i3][16]".

## Creating a i3 Log File
Particularly when making modifications to i3's configuration files and its general setup,
it is helpful to see its warning and error messages.
i3 logs useful warning and error messages to [stdout][19].
`i3-nagbar` will pop up when your get a sever error
and give you an option to place information in a terminal window.
This is clumsy,
so to have a clearly defined place where this information can be logged,
you should [redirect i3's stdout and stderr to a log file][20].
So where is i3 executed so we can do the redirection?
i3 could be started by `~/.xsession`, `~/.xinitrc`,
or more likely by your [display manager][17],
depending on the Linux distibrution you are using
(See "[How do xsession, xinitrc and .i3/config play together?][24]").
Within Ubuntu, i3 is executed by the display manager.

[There is no simple linux command that will tell you what your Display manager is][10],
but Ubuntu does store it in the file `/etc/X11/default-display-manager`.
In my case, its the cross-desktop display manager [LightDM][11] (`/usr/sbin/lightdm`).
It is here that i3 is initiated.

What I want to do is modify things so that the display manager
fires up i3 such that its logging messages.
I have found very little [documentation on customizing the Display Manager][12].
What I did find is that within Ubuntu, the [`/usr/share/xsessions/i3.desktop`][22] file
is what the display manager uses to execute the i3 Window Manager
(Use of the [`.desktop` file][23] might also do the trick).
It looks something like this:

```
[Desktop Entry]
Name=i3
Comment=improved dynamic tiling window manager
Exec=/usr/bin/i3
TryExec=i3
Type=Application
X-LightDM-DesktopName=i3
DesktopNames=i3
```

[Exec][21] specify the command to run when the menu item is clicked.
It will accept command line arguments as well or can also be set to a custom script.
SO all that needs to be done is to convert `Exec=/usr/bin/i3`
to something like `Exec=/usr/bin/i3 > /tmp/i3-messages.log 2>&1`.
I want to toggle the level of logging and keep log files without much hassle.
To do this, I used a script.
I used `Exec=/home/jeff/.i3/i3-exec.sh` where `i3-exec.sh` is somthing like this

```bash
#!/bin/bash

OPTIONS=""
#OPTIONS="-V -d all"

LOGFILE="i3.log"
#LOGFILE="i3-$(date +'%F-%k-%M-%S').log"

LOGPATH="$HOME/.i3"

# i3 message logging
echo -e "\n\n********** Starting i3 at $(date) **********\n\n" > $LOGPATH/$LOGFILE
exec /usr/bin/i3 $OPTIONS >> $LOGPATH/$LOGFILE 2>&1
```

## i3 Start-Up Screen Layout
json files

----

# Using i3

## Using Layout
The layout feature is surprisingly challenging to use.
I3's concept of placeholder window which "swallows" apps means
that if you want many times the same app like lxterminal or urxvt for a single workspace,
then you have to differentiate them using --name something when you exec them in .i3/config.

Layout saving/restoring allows you to load a JSON layout file
so that you can have a base layout to start working with after powering on your computer.
Dynamic use-cases also come to mind:
if you frequently (but not always!)
need a grid layout of terminals with ping/traceroute commands to diagnose network issues,
you can easily automate opening these windows in just the right layout.

## Saving the Screen layout
http://i3wm.org/docs/layout-saving.html
http://www.slackword.net/?p=733

On a Chromebook
For a proper Delete key, use `bindsym $mod+BackSpace exec xdotool key Delete` in your i3 config file

## Basic Layout Management
define containers

Every time you open an application it fills the available space.
Terminals / applications are either lined up side-by-side, or stacked on top of each other.
To open a terminal session, enter `$mod+Return`.
There are also multiple keyboard combinations for selecting the focus window,
such as `$mod+arrow` key.
Press `$mod+v` will cause the next terminal to be stacked vertically,
and `$mod+h` lines them up side-by-side (horizontally).

`$mod+Shift+spacebar` toggles a floating screen.
This removes it from the tiles,
and you can drag it around and resize it like in a non-tiling window manager.

Open a second virtual desktop with `$mod+2`.
i3 closes virtual desktops automatically when you close all the applications on them.
`$mod+n` navigates to an existing virtual desktop, or creates a new one.

`$mod+f` toggles fullscreen.

`$mod+e` toggles horizontal and vertical layout,
`$mod+s` stacks open windows,
and `$mod+w` tabs them.

Open a second virtual desktop with `$mod+2`.
i3 closes virtual desktops automatically when you close all the applications on them.
`$mod+n` navigates to an existing virtual desktop, or creates a new one.
You can also go to a virtual desktop by picking via the mouse the number in lower left.

Resize a window by dragging with the mouse its header bar.

To make a tilled window a floater, `$mod+Shift+Space`.

Drag and resize floating window using `$mod+left/right mouse button`.

## Scratchpad
Scratchpad lets you hide open applications.
For example, if you open up a text document by clicking the file icon in nautilus,
in accordance to the tilling window manager,
it takes one half of the screen.
If you feel nautilus is a nuisance in this situation,
you can hide nautilus by pressing `$mod+Shift+–`, when it is in focus.

This might be useful in situations where you need to compare two documents,
and don’t want the workspace to be taken by other applications.
If you need to bring back applications from scratch, you can press `$mod+–`.
These applications will open in floating mode.
Therefore, to move it back to tilling mode, you can press `$mod+Shift+Space` keys.

## Making Changes to Configuration
For most `~/.i3/config` changes, press `$mod+Shift+c` to reload the file and activate changes.
If that doesn't work then `$mod+Shift+r` restarts i3,
preserving your layout and open applications.
To load your new background image you need to log out of i3 and log back in.
`$mod+Shift+e` exits i3, and then you log back in the usual way with your Linux display manager.

## Installing i3 Extentions
When i3 is installed,
the background image is whatever has been set for your X11 root window.
You need an external app to set a background image.
`feh` is a nice little app for this.
Open `~/i3/config` and configure a background image
by adding line like this anywhere in the file:

```bash
exec --no-startup-id feh --bg-scale /path/to/picture
```

* `--no-startup-id` disables the startup notification so you don't have an hourglass in your way for 60 seconds.
* `--bg-scale` makes your image fill the screen, and does not preserve the aspect ratio.

## Sending Messages to i3 Window Manager
[i3-msg][11] send messages to i3 window manager

You can do such things as start applications on specific workspaces when i3 starts.
For example, to start firefox on workspace 2,
or to logout of i3, etc.:

```bash
# start firefox on workspace called 2:Web
i3-msg 'workspace 2:Web; exec firefox'

# rename a workspace from 2:Web to FireFox
i3-msg 'rename workspace 2:Web to FireFox'

# reload i3 config file
i3-msg reload

# logout of i3
i3-msg exit
```

## Customizing i3 Status Bar
i3’s default status bar, encode in the file `/etc/i3status.conf`,
is displayed by a tool called [i3status][12].
Your customized status bar is located in `~/.i3status.conf`.

## Auto-start Applications
At launch you configure i3 to run a script to detect/setup
a second display if attached (using [`xrandr`][04]), open a terminal,
and run any extra commands as determined by $HOSTNAME:

## Displaying Keyboard Layout
http://docs.slackware.com/howtos:window_managers:keyboard_layout_in_i3

# Chromebook Key Bindings
[i3 window manager on a chromebook](http://people.oregonstate.edu/~thomasky/?q=node/31)
Consider this:

* To switch from chroot to ChromeOS: Ctrl-Alt-Shift-Forward
* To switch from ChromeOS back to chroot: Ctrl-Alt-Forward then Ctrl-Alt-Refresh

## Start Applications in Workspaces
start applications on specific workspaces when i3 starts
http://unix.stackexchange.com/questions/96798/i3wm-start-applications-on-specific-workspaces-when-i3-starts

How do you implement layout with the autostarting of applications in the i3 window manager?
http://unix.stackexchange.com/questions/134980/how-do-you-implement-layout-with-the-autostarting-of-applications-in-the-i3-wind


## Cheatsheets
http://i3wm.org/docs/refcard.pdf
http://www.cheatography.com/davechild/cheat-sheets/i3-window-manager/
http://walther.io/getting-started-and-going-further-with-i3-window-manager/

* General
    * `startx i3` start i3 from command line
    * `$mod+<Enter>` open a terminal
    * `$mod+d` open dmenu (text based program launcher)
    * `$mod+r` resize mode (<Esc> or <Enter> to leave resize mode)
    * `$mod+shift+e` exit i3
    * `$mod+shift+r` restart i3 in place
    * `$mod+shift+c` reload config file
    * `$mod+shift+q` kill window (does normal close if application supports it)

* Windows
    * `$mod+w` tabbed layout
    * `$mod+e` vertical and horizontal layout (switches to and between them)
    * `$mod+s` stacked layout
    * `$mod+f` fullscreen

* Moving Windows
    * `$mod+shift+<direction key>` Move window in _direction_ (depends on direction keys settings)

# i3 Extensions
As well as configuring i3,
people have been busy extending its capabilities.
Here are just a few:

* [I3pystatus](https://github.com/enkore/i3pystatus) is a replacement for the status bar that’s extensible in Python.
* There’s also [QuickSwitch](https://github.com/proxypoke/quickswitch-for-i3) which is a utility to help you find and control windows in i3.

# File Manager - Krusader
Nautilus - doesn't behave properly
Midnight Commander - mc - very light weight - can't make it float, wants to be in terminal window - https://en.wikipedia.org/wiki/Midnight_Commander
Krusader -  heavy but ok - behaves nicely behaves like Midnight Commander but graphical - https://en.wikipedia.org/wiki/Krusader

* [Orthodox File Manager (OFM) paradigm](https://en.wikipedia.org/wiki/File_manager)
* [The Krusader Handbook](https://krusader.org/documentation/)

----

# Sources
Out of respect, guilt, and a morbid fear of lawyers,
I have maintained a reasonably complete list of sources.
Check out the references / sources within the links in the above text and the sources listed below.
If your lucky, you may find a few additional gems you can add to your i3 configuration.

* [~/.i3/config](https://linuxious.com/files/i3/)
* [Hands on with the i3 Window Manager: Installing, configuring and using](http://www.zdnet.com/article/hands-on-with-the-i3-window-manager-installing-configuring-and-using/)
* [i3 is awesome](http://jirichara.com/i3-is-awesome)
* excellent source of ideas - https://wiki.archlinux.org/index.php/i3#Save_and_restore_the_window_layout
* [Configuring i3 for my setup](http://blog.tunnelshade.in/2014/05/making-i3-beautiful.html)
* [Empty workspace in I3 WM](http://sainathadapa.github.io/blog/i3-empty-workspace-workaround/)
* [i3 tips ‘n’ tricks](https://extendedreality.wordpress.com/2014/11/20/i3-tips-n-tricks/)
* [Gnome 3 to i3](http://www.ninjaducks.in/hacking/gnome-3-to-i-3/)

* [i3 window manager extensions](http://www.getreu.net/public/downloads/i3-extensions.html)
* [quickswitch for i3](https://github.com/proxypoke/quickswitch-for-i3)
* [Improved i3 Workspace Switcher](https://travisf.net/i3-wk-switcher)
* [i3-finder](https://www.npmjs.com/package/i3-finder)

* [i3-nagbar - displays an error bar on top of your screen](http://build.i3wm.org/docs/i3-nagbar.html)
* [i3 logging and LXDM](http://b.wardje.eu/2012/06/i3-logging-and-lxdm.html)

* [How to switch windows manager on-the-fly?](http://askubuntu.com/questions/159505/how-to-switch-windows-manager-on-the-fly)
* [Find current Window Manager and changing window manager](https://ubuntuforums.org/showthread.php?t=1709792)



[01]:https://en.wikipedia.org/wiki/Tiling_window_manager
[02]:http://i3wm.org/
[03]:https://en.wikipedia.org/wiki/Rifleman%27s_Cree
[04]:https://www.youtube.com/watch?v=YoU2hlDJmFE
[05]:https://www.x.org/archive/X11R6.7.0/doc/xprop.1.html
[06]:https://www.x.org/releases/current/doc/man/man1/xev.1.xhtml
[07]:http://xwinman.org/intro.php
[08]:http://askubuntu.com/questions/18078/what-is-the-difference-between-a-desktop-environment-and-a-window-manager
[09]:http://adereth.github.io/blog/2013/10/02/why-you-should-try-a-tiling-window-manager/
[10]:https://github.com/jeffskinnerbox/.i3
[11]:http://build.i3wm.org/docs/i3-msg.html
[12]:http://i3wm.org/i3status/manpage.html
[13]:http://conky.sourceforge.net/documentation.html
[14]:https://github.com/jeffskinnerbox/.X/blob/master/xsessionrc
[15]:http://i3wm.org/docs/user-contributed/conky-i3bar.html
[16]:http://sagar.se/using-conky-with-i3.html
[17]:https://en.wikipedia.org/wiki/X_display_manager_(program_type)
[18]:http://build.i3wm.org/docs/i3-config-wizard.html
[19]:https://en.wikipedia.org/wiki/Standard_streams#Standard_output_.28stdout.29
[20]:http://i3wm.org/docs/debugging-release-version.html
[21]:https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html#exec-variables
[22]:http://askubuntu.com/questions/150487/what-happens-under-the-covers-to-log-me-in-and-start-up-unity-or-another-graphic?r
[23]:https://linuxcritic.wordpress.com/2010/04/07/anatomy-of-a-desktop-file/
[24]:https://faq.i3wm.org/question/18/how-do-xsession-xinitrc-and-i3config-play-together.1.html
[25]:
[26]:
[27]:
[28]:
[29]:
[30]:
