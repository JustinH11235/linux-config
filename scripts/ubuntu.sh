# Should be run as sudo ./ubuntu.sh (be careful!)
# all commands that should be run as normal user will start with sudo -u justin [command]
echo "removing snapd"
apt remove snapd

echo "updating and upgrading apt =========="
apt update && apt upgrade

echo "apt installing programs =========="
apt install wget curl neofetch htop vim inxi git xclip haskell-platform

echo "making deb-apps/ directory in Documents/"
sudo -u justin mkdir -p /home/justin/Documents/deb-apps/

echo "setting global git config"
sudo -u justin git config --global user.email "justin.h.hinckley@gmail.com"
sudo -u justin git config --global user.name "Justin Hinckley"


# Manual Installs ==========

# VSCode
# https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
# mv ~/Downloads/code_* ~/Documents/deb-apps/
# cd ~/Documents/deb-apps/
# sudo apt install ./code_*

# JetBrains Toolbox
# https://www.jetbrains.com/toolbox-app/
# mv ~/Downloads/jetbrains-toolbox-* ~/Documents/deb-apps/
# cd ~/Documents/deb-apps/
# sudo tar -xzf jetbrains-toolbox-* -C /opt
