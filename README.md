
dotfiles
========

What's this?
--------------------------------
These are all my config files -- dotfiles -- for  UNIX/Linux systems,
all stored in git to make it easy to keep them in sync across multiple
systems.

How does it work?
-----------------
* Running `python link.py` creates symbolic links to the dotfiles in the
repository in `$HOME`. **Existing symbolic links will be
overwritten**, but existing files of any other type will not.

Original from https://github.com/oyvindio/dotfiles 
