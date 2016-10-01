<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.4.0
-->

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
you'll discover just how fast your computer can be by use a window manager like i3.

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

# Installing i3
Assuming you are already working in a traditional desktop environment like GNOME,
here is what you should install:

https://fedoramagazine.org/getting-started-i3-window-manager/

```bash
# install i3 and supporting programs
sudo apt-get install i3 i3lock xautolock i3status feh dunst dmenu wmctrl conky x11-utils
```

These are the program and configuration files that will be installed:

* **i3** is the main window manager package.
* **i3lock**  is a screen-lock utility.
* **xautolock** is inactivity timeout/lock utility.
* **i3status** is a utility to generate a string with information to be displayed in the i3bar.
* **feh** is a utility to set a wallpaper.
* **dunst** is a simple notification utility for things like wireless network status.
* **dmenu** is a utility to launch our apps in the i3 desktop.
* **wmctrl** is a utility to query the window manager for information and request actions be taken.
* **conky** is a utility to display information of the system in a awesome way.
* **x11-utils** is a package contains several useful X Window utilities (like xprop which lists properties of a window).

Install i3 and these supporting packages, then log out.
When you log back in, change your window manger to i3 from your display manager screen.

On its first run i3 walks you through a simple configuration wizard.
First you must decide if you want the wizard to create a `~/i3/config` file.
Say yes.
Then choose your mod (modifier) key, either the `Win`
(on many keyboards it bears the Windows logo) or `Alt` key.
If you choose the `Alt` keep in mind that you could conflict
with a lot of application keybindings and commands, so choose `Win` is a good option.
If your working on a Chromebook, there is no `Win` key, so you best bet is the `Alt`.

----

# Install the i3 Dotfiles
This **.i3** GitHub repository contains the i3 configuration files
and shell scripts (`config`, `i3status.conf`, etc.)
used to make my i3 window manager useful for my needs.

>This is my i3-config. There are many like it, but this one is mine.
My i3-config is my best friend. It is my life. I must master it as I must master my life.
(See [Full Metal Jacket][04] or [The Rifleman's Creed][03])

## Install Dotfiles
To clone this i3 configuration on another system, execute the following:

    cd ~
    git clone https://github.com/jeffskinnerbox/.i3.git
    ln -s ~/.i3/i3status.conf ~/.i3status.conf

With this installed, we now move on to installing i3 itself
and configuring the Linux system to make use of the configuration files.

----

# Using i3

----

# Sources
Out of respect, guilt, and a morbid fear of lawyers, I maintain a reasonably
complete list of sources.
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
[05]:
[06]:
[07]:http://xwinman.org/intro.php
[08]:http://askubuntu.com/questions/18078/what-is-the-difference-between-a-desktop-environment-and-a-window-manager
[09]:http://adereth.github.io/blog/2013/10/02/why-you-should-try-a-tiling-window-manager/
[10]:
