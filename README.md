# linux-config

### Install a script (this can break your system):
`wget -O - --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/JustinH11235/linux-config/master/scripts/_ | bash`

### Download a dotfile:
`wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/JustinH11235/linux-config/master/dotfiles/_`

## **scripts:**
* ubuntu<span>.</span>sh
    * Post-installation script for Ubuntu-based distributions (Ubuntu, Kubuntu, Linux Mint, etc.)
* kubuntu<span>.</span>sh
    * Post-installation script for Kubuntu. Most overlaps with ubuntu<span>.</span>sh, apart from a few differences:
        * Removes snapd
        * Sets up autostart script that adds GitHub ssh key to ssh-agent (not needed for other distributions that use GNOME keyring ssh agent or similar programs by default)

## **dotfiles:**
* .bashrc
    * Custom aliases:
        * v - alias for vim
        * .. - moves you up one directory
        * cdl [directory] - cd's to a directory and then lists contents
        * dw [program] - runs the last command but replaces program that is run (e.g. if last command is `touch test.txt`, then `dw vim` will open `test.txt` in vim)
        * copy [filename] - copies contents of file to clipboard
    * Runs `neofetch` when shell starts
    * `PS1` prompt appends the current `git` branch in red
    * Default [nvm](https://github.com/nvm-sh/nvm#readme) configuration
* .vimrc
    * Automatically installs [vim-plug](https://github.com/junegunn/vim-plug) and a list of plugings
    * Automatically installs the [molokai](https://github.com/tomasr/molokai) theme
    * Includes custom keybinds, relative/absolute line numbering, airline status bar, and other vim customizations
