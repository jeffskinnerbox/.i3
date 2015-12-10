# i3 Window Manager Dotfiles
**Bash Dotfiles** is a mash up of my bash profile/resource files, scripts, functions,
aliases and other bash stuff I have created, found, or more likely ripped off from others.
Therefore, out of respect, guilt, and a morbid fear of lawyers, I maintain a reasonably
complete list of sources.  Check out the references / sources and you may find
a few additional gems.

### Bash
According to the bash man page, .bash_profile is executed for login shells,
while .bashrc is executed for interactive non-login shells.

When you login (type username and password) via console, either sitting at the
machine, or remotely via ssh: .bash_profile is executed to configure your shell
before the initial command prompt.  But, if you’re already logged into your
machine and open a new terminal window (xterm) inside Gnome or KDE, then
.bashrc is executed before the window command prompt. .bashrc is also run when
you start a new bash instance by typing /bin/bash in a terminal.

### References / Sources
* [shopt manual page](http://ss64.com/bash/shopt.html)
* [Advanced Bash-Scripting Guide: Samples](http://tldp.org/LDP/abs/html/sample-bashrc.html)

### Aliases and Functions
A Bash alias is essentially nothing more than a keyboard shortcut, an
abbreviation, a means of avoiding typing a long command sequence.  Bash does
not expand arguments within the alias body, or expand an alias itself with Linux
"compound constructs," such as if/then statements, loops, and functions, nor
will alias’ expand recursively.

In Bash, a function is like a subroutine, a code block that implements a set of
operations, that performs a specified task. Wherever there is repetitive code,
when a task repeats with only slight variations in procedure, then consider
using a function.

### References / Sources
* [Advanced Bash-Scripting Guide: Aliases](http://tldp.org/LDP/abs/html/aliases.html})
* [Advanced Bash-Scripting Guide: Functions](http://tldp.org/LDP/abs/html/functions.html)
* [Hayne of Tintagel](http://hayne.net/MacDev/Bash/aliases.bash)
* [30 Handy Bash Shell Aliases For Linux](http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html)

### Install
To clone these Bash scripts and use them on another system, execute the following:

    cd ~
    git clone https://github.com/jeffskinnerbox/.bash.git
    ln -s ~/.bash/bash_login ~/.bash_login
    ln -s ~/.bash/bash_logout ~/.bash_logout
    ln -s ~/.bash/bash_profile ~/.bash_profile
    ln -s ~/.bash/dircolors.old ~/.dircolors


    cd ~
    git clone https://github.com/jeffskinnerbox/.i3.git
    ln -s ~/.i3/i3status.conf ~/.i3status.conf
