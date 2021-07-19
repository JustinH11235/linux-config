# Should be run as sudo ./ubuntu.sh (be careful!)
# all commands that should be run as normal user will be inside the USER SECTION block

# ROOT SECTION ==========
echo "removing snapd"
apt remove snapd

echo "updating and upgrading apt =========="
apt update && apt upgrade

echo "apt installing programs =========="
apt install wget curl neofetch htop vim vim-gtk inxi git xclip haskell-platform

# USER SECTION ==========
# All commands that should be run as user
sudo -u justin -i <<'EOF'
echo "making deb-apps/ directory in Documents/"
mkdir -p /home/justin/Documents/deb-apps/

echo "setting global git config"
git config --global user.email "justin.h.hinckley@gmail.com"
git config --global user.name "Justin Hinckley"

echo "generating Github ssh keys"
ssh-keygen -t ed25519 -C "justin.h.hinckley@gmail.com" -f /home/justin/.ssh/id_ed25519_github -P ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github
EOF

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
