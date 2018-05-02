# Spacelite (minimal yet functional emacs)

Spacelite is just a minimal evil + emacs configuration with following:
- `evil` with `evil-escape`, `evil-iedit`
- `use-package` for dependencies
- `spacemacs` like leader key(`space` by default) bindings.
- `helm` with `helm-ag`, `helm-projectile`
- `projectile` with `recentf`, 
- `undo-tree`
- `flyspell` for spellchecking
- `diminish` for clean status line
- `magit` with `evil-magit`
- some simple `MacOs` keybindings (only enabled in OSX/emacs)
- `which-key` for shortcut help
- `solarized-dark` theme
- `highlight-parentheses`, `evil-anzu`, `restart-emacs`, `emacs-shell` etc.
- `scala` support with cutting edge `ensime` (you can(should if you are not using ensime snapshot builds already) disable this in `init.el`)
- a ligh but useful modeline with [spaceline](https://github.com/TheBB/spaceline).

All of above with proper(for me) evil(-like) key bindings.

Note: This "thing" is my personal configuration that I use at work and personal life; only tested on a Macbook Pro running `MacOS Sierra`.

# Installation

`git clone https://github.com/hzenginx/spacelite ~/.emacs.d`

# Why
There is [spacemacs](https://github.com/syl20bnr/spacemacs) as we all know. But for me it comes with too much unnecessary packages. Also I don't like the concept of layers as it doesn't feels flexible enough.
Also this can be a start point for people who wants to start with `emacs` and `evil`.

# Screenshot

![Scala](https://i.imgur.com/C9fVcyM.png)
![ELisp](https://i.imgur.com/fMeimgG.png)

# Contribution

If you use this configuration and want to improve just open a issue and/or a pull request.

# What is missing?

*This is just a list that I want to implement in near feature.*
 - Spacemacs like toggles
 - Optimization on package loading. There may be some packages needs to be deferred.
 - Generic goto defination like Spacemacs. (I want to be able to use this configuration for multiple programming languages at the same time.)
 - ~~Spaceline~~

# License
The license is GPLv3.
Note that Spacelite is heavily inspired from [Spacemacs](https://github.com/syl20bnr/spacemacs). Can even contain nearly identical code from it.
