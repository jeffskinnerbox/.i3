<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.4.0
-->

Status: draft
Title: Cheatsheet: i3 Window Manager
Date: 2100-01-01 00:00
Category: Software
Tags: i3, Window Manager
Slug: cheatsheet-i3-window-manager
Author: Jeff Irland
Image: cheat-sheet.jpg
Summary: The i3 tiling window manager is a nice modern tiling window manager that works unders GNU/Linux/BSD operating systems. It supports tiling, stacking, tabs, virtual desktops, and multiple monitors. You can do almost everything from the keyboard, or mix up keyboard and mouse.  It's well documented and real simple to modify and tinker with. With extremely easy to remember keybindings, using i3 is extremely enjoyable, even without the need for a mouse.

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

As well as configuring i3, you can also get extra software to help you. I3pystatus (https://github.com/enkore/i3pystatus) is a replacement for the status bar that’s extensible in Python. There’s also QuickSwitch (https://github.com/proxypoke/quickswitch-for-i3) which is a utility to help you find and control windows in i3.




<a href="https://i3wm.org/">
    <img class="img-rounded" style="margin: 0px 8px; float: left" title="i3 is a tiling window manager designed for X11  and runs on all version of Linux. It supports tiling, stacking, and tabbing layouts, which it handles dynamically. Configuration is achieved via plain text file and extending i3 is possible using its Unix domain socket and JSON based IPC interface from many programming languages." alt="i3-logo" src="{filename}/images/i3_window_manager_logo.png" width="100" height="100" />
</a>
For quite some time I had started feeling all the panels,
the system menus, the starters, the status applets, desktop background,
drag-drop functionality, border decoration and animations
which Desktop environments provide to be useless.
These functionalities consumed a lot of resources, slowing down my system,
and take up screen space.
I could do away with all this functionality.
I just needed a [Window Manager][07] without all the [Window Desktop][08] crap.

A [Tiling Window Manager][09] can increase your efficiency by providing a lot of keyboard shortcuts.
They make you less dependent on mouse.
It is hard to get used to at first but you get used to it eventually.
They are heavily customizable.
To start with, you can provide your own keyboard shortcuts
but essentially you can make your own environment.

There are many tiling window managers available out there but I chose i3.
The [i3 tiling window manager][01] is a nice modern tiling window manager
that is open source and very well documented.
It supports tiling, stacking, tabs, virtual desktops, and multiple monitors.
You can do almost everything from the keyboard, or mix up keyboard and mouse.
i3 is highly configruable and not dogmatic about tiling geometry and lets you have it your way.

## Installing i3
Install i3, then log out,
and you log back in change your window manger as i3 from your display manager screen.
Here is what you should install:

```bash
sudo apt-get install i3 i3lock xautolock i3status feh wmctrl x11-utils
```

On its first run i3 walks you through a simple configuration wizard.
First you must decide if you want the wizard to create a `~/i3/config` file.
Say yes.
Then choose your mod (modifier) key, either the `Win`
(on many keyboards it bears the Windows logo) or `Alt` key.
If you choose the `Alt` keep in mind that you could conflict
with a lot of application keybindings and commands, so choose `Win` is a good option.
On a Chromebook, there is no `Win` key, so you best bet is the `Alt`.

## Where is i3 Executed?
Check out man startx - http://superuser.com/questions/659692/execute-script-after-the-window-manager-loads
https://wiki.ubuntu.com/CustomXSession


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

## Tools to Help Discover Key Names and Window Properties
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

## Sending Messages to i3 Window Manager
[i3-msg][02] send messages to i3 window manager

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
is displayed by a tool called [i3status][03].
Your customized status bar is located in `~/.i3status.conf`.

## Start Applications in Workspaces
start applications on specific workspaces when i3 starts
http://unix.stackexchange.com/questions/96798/i3wm-start-applications-on-specific-workspaces-when-i3-starts

How do you implement layout with the autostarting of applications in the i3 window manager?
http://unix.stackexchange.com/questions/134980/how-do-you-implement-layout-with-the-autostarting-of-applications-in-the-i3-wind

Conky on i3
* https://bbs.archlinux.org/viewtopic.php?id=168415
* http://i3wm.org/docs/user-contributed/conky-i3bar.html
* http://sagar.se/using-conky-with-i3.html
* http://blog.kaiserapps.com/2014/02/my-killer-i3-setup.html

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

## Auto-start Applications
At launch you configure i3 to run a script to detect/setup
a second display if attached (using [`xrandr`][04]), open a terminal,
and run any extra commands as determined by $HOSTNAME:

## Saving the Screen layout
http://i3wm.org/docs/layout-saving.html
http://www.slackword.net/?p=733

On a Chromebook
For a proper Delete key, use `bindsym $mod+BackSpace exec xdotool key Delete` in your i3 config file

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

## Pango Markup
https://developer.gnome.org/pygtk/stable/pango-markup-language.html

Pango is the core text/font layout engine library used in GNOME applications.
It has extensive support for the different writing systems used throughout the world.

## Updates to Display Manager and Environment Variables
* http://jeffskinnerbox.me/posts/2014/Dec/19/repurposing-a-vintage-laptop-to-create-a-x-terminal/
* [What happens under the covers to log me in and start up Unity or another Graphical User Interface?](http://askubuntu.com/questions/150487/what-happens-under-the-covers-to-log-me-in-and-start-up-unity-or-another-graphic?r)
* https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html
* https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s05.html
* best - https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html#exec-variables

[There is no simple linux command that will tell me what your Display manager is][10],
but Ubuntu does store it in the file `/etc/X11/default-display-manager`.
In my case, its the cross-desktop display manager [LightDM][11] (`/usr/sbin/lightdm`).
It is here that i3 is initiated.

I need to modify things so that the Display Manager fires up i3 such that its logging messages.
I have found very little [documentation on customizing the Display Manager][12].

Modify the `/usr/share/xsessions/i3.desktop` file
so when the i3 Window Manager is fired up, it perfroms logging.

**Encoding** line is referring to the character encoding used in the file, and can safely be left at UTF-8 for nearly all purposes.
**Name** is what will be displayed on GDM’s Sessions list, followed by a brief description in the **Comment** line.
**Exec** specify the command to run when the menu item is clicked. It will accept command line arguments as well or can also be set to a custom script.
**Icon** is used to specify the icon for an application, but it is not mandatory for the launchers in the session list.

Convert `Exec=i3` to `Exec=i3 > ~/.i3/i3-message.log 2>&1`.

Since .desktop files have uses beyond just GDM, they include a Type field to specify what the file represents. It can be left at Application for these purposes.

## Debuging i3 Release Version
* http://i3wm.org/docs/debugging-release-version.html
* http://manpages.ubuntu.com/manpages/trusty/man1/i3.1.html
* [How do xsession, xinitrc and .i3/config play together?](https://faq.i3wm.org/question/18/how-do-xsession-xinitrc-and-i3config-play-together.1.html)

i3 logs useful warning and error messages to stdout.
`i3-nagbar` will pop up when your get a sever error
and give you an option to place information in a terminal window.
This is clumsy, so to have a specific place where these message can be logged,
you should redirect stdout and stderr where ever you start i3 (~/.xsession).

```bash
# i3 message logging
exec /usr/bin/i3 > ~/.i3/i3log-$(date +'%F-%k-%M-%S') 2>&1

# enable verbose output and all levels of debug output
exec /usr/bin/i3 -V -d all > ~/.i3/i3log-$(date +'%F-%k-%M-%S') 2>&1
```

## Use of .Desktop
* https://linuxcritic.wordpress.com/2010/04/07/anatomy-of-a-desktop-file/
* http://build.i3wm.org/docs/i3-dmenu-desktop.html

## Corky
See your ~.X/xscreenrc file for how your got Corky to work properly
add this

```bash
if [ "$(wmctrl -m | grep Name | awk '{ print $2 }')" == "i3" ]; then   # check for type of window manager
    cp $HOME/.conky/src/ubuntu-i3-conkyrc $HOME/.conky/conkyrc
```

## Displaying Keyboard Layout
http://docs.slackware.com/howtos:window_managers:keyboard_layout_in_i3

# Chromebook Key Bindings
[i3 window manager on a chromebook](http://people.oregonstate.edu/~thomasky/?q=node/31)
Consider this:

* To switch from chroot to ChromeOS: Ctrl-Alt-Shift-Forward
* To switch from ChromeOS back to chroot: Ctrl-Alt-Forward then Ctrl-Alt-Refresh

## Cheatsheets
http://i3wm.org/docs/refcard.pdf
http://www.cheatography.com/davechild/cheat-sheets/i3-window-manager/

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



[01]:http://i3wm.org/
[02]:http://build.i3wm.org/docs/i3-msg.html
[03]:http://i3wm.org/i3status/manpage.html
[04]:http://pkg-xorg.alioth.debian.org/howto/use-xrandr.html
[05]:https://www.x.org/archive/X11R6.7.0/doc/xprop.1.html
[06]:https://www.x.org/releases/current/doc/man/man1/xev.1.xhtml
[07]:http://xwinman.org/intro.php
[08]:http://askubuntu.com/questions/18078/what-is-the-difference-between-a-desktop-environment-and-a-window-manager
[09]:http://adereth.github.io/blog/2013/10/02/why-you-should-try-a-tiling-window-manager/
[10]:http://unix.stackexchange.com/questions/20370/is-there-a-simple-linux-command-that-will-tell-me-what-my-display-manager-is
[11]:https://wiki.ubuntu.com/LightDM
[12]:https://www.maketecheasier.com/customize-the-gdm-sessions-list/
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
