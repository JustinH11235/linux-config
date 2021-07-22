# ROOT SECTION ==========
echo "removing snapd =========="
sudo apt remove -y snapd

echo "updating and upgrading apt =========="
sudo apt update
sudo apt upgrade -y

echo "apt installing programs =========="
sudo apt install -y software-properties-common apt-transport-https wget curl neofetch htop vim vim-gtk inxi git xclip haskell-platform virtualbox ksshaskpass

echo "adding Microsoft GPG key and installing Visual Studio Code with apt =========="
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -y code

echo "apt autoremoving programs =========="
sudo apt autoremove -y

# USER SECTION ==========
echo "finding latest nvm release =========="
NVM_LATEST_RELEASE=$(curl https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep "^ *\"tag_name\": " | sed -E 's/^ *"tag_name": "([^"]+)".*/\1/')
echo "installing latest nvm release: $NVM_LATEST_RELEASE =========="
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_LATEST_RELEASE/install.sh | bash
source ~/.bashrc
echo "installing the latest version of node =========="
nvm install node

echo "downloading and extracting latest version of JetBrains Toolbox =========="
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash
echo "installing JetBrains Toolbox =========="
cd /opt/jetbrains-toolbox/
./jetbrains-toolbox

echo "making deb-apps/ directory in Documents/ =========="
mkdir -p ~/Documents/deb-apps/

echo "setting global git config =========="
git config --global user.email "justin.h.hinckley@gmail.com"
git config --global user.name "Justin Hinckley"

echo "generating Github ssh keys =========="
ssh-keygen -t ed25519 -C "justin.h.hinckley@gmail.com" -f ~/.ssh/id_ed25519_github -P ""
echo "creating autoscript file to add GitHub ssh key to agent - https://wiki.archlinux.org/title/KDE_Wallet =========="
echo "ssh-add -q ~/.ssh/id_ed25519_github < /dev/null" > ~/.config/autostart-scripts/ssh-add.sh
echo "adding GitHub ssh key to agent manually first time =========="
ssh-add ~/.ssh/id_ed25519_github
echo ""
echo "copy the below generated public key to put in GitHub settings: =========="
cat ~/.ssh/id_ed25519_github.pub
echo ""

echo "configuring vim =========="

# https://github.com/tomasr/molokai
echo "downloading molokai theme =========="
mkdir -p ~/.vim/colors/
cd ~/.vim/colors/
wget -O molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

echo "downloading custom .vimrc"
cd ~/
wget -O .vimrc https://raw.githubusercontent.com/JustinH11235/linux-config/master/dotfiles/.vimrc

echo "downloading custom .bashrc"
cd ~/
wget -O .bashrc https://raw.githubusercontent.com/JustinH11235/linux-config/master/dotfiles/.bashrc


# Manual Installs ==========

