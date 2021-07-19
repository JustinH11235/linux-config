# linux-config

### Install a script (this can break your system):
`wget -O - https://raw.githubusercontent.com/JustinH11235/linux-config/master/scripts/_ | sudo bash`

### Download a dotfile:
`wget https://raw.githubusercontent.com/JustinH11235/linux-config/master/dotfiles/_`

## **scripts:**
* ubuntu<span>.</span>sh
    * Post-installation script for Ubuntu-based distributions (Ubuntu, Kubuntu, Linux Mint, etc.)

## **dotfiles:**
* .bashrc
    * My current bash configuration
    * Custom aliases:
        * v - alias for vim
        * .. - moves you up one directory
        * cdl [directory] - cd's to a directory and then lists contents
        * dw [program] - runs the last command but replaces program that is run (e.g. if last command is `touch test.txt`, then `dw vim` will open `test.txt` in vim)
        * copy [filename] - copies contents of file to clipboard
    * Runs `neofetch` when shell starts
    * `PS1` prompt appends the current `git` branch in red
    * Default [nvm](https://github.com/nvm-sh/nvm#readme) configuration
