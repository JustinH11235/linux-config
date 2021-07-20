# ROOT SECTION ==========
echo "removing snapd =========="
sudo apt remove snapd

echo "updating and upgrading apt =========="
sudo apt update && apt upgrade

echo "apt installing programs =========="
sudo apt install wget curl neofetch htop vim vim-gtk inxi git xclip haskell-platform virtualbox

echo "apt autoremoving programs =========="
sudo apt autoremove

# USER SECTION ==========
echo "finding latest nvm release =========="
NVM_LATEST_RELEASE=$(curl https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep "^ *\"tag_name\": " | sed -E 's/^ *"tag_name": "([^"]+)".*/\1/')
echo "installing latest nvm release: $NVM_LATEST_RELEASE =========="
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_LATEST_RELEASE/install.sh | bash

echo "installing latest version of JetBrains Toolbox =========="
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash

echo "making deb-apps/ directory in Documents/"
mkdir -p /home/justin/Documents/deb-apps/

echo "setting global git config"
git config --global user.email "justin.h.hinckley@gmail.com"
git config --global user.name "Justin Hinckley"

echo "generating Github ssh keys"
ssh-keygen -t ed25519 -C "justin.h.hinckley@gmail.com" -f ~/.ssh/id_ed25519_github -P ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github
echo ""
echo "copy the below generated public key to put in GitHub settings: =========="
cat ~/.ssh/id_ed25519_github.pub
echo ""

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
