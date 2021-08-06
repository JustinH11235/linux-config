# ROOT SECTION ==========
echo "removing snapd =========="
sudo apt remove -y snapd

echo "updating and upgrading apt =========="
sudo apt update
sudo apt upgrade -y

echo "apt installing programs =========="
sudo apt install -y software-properties-common apt-transport-https wget curl neofetch htop vim-gtk inxi git xclip haskell-platform virtualbox ksshaskpass jq php-cli python3-venv net-tools ncat sqlite3

echo "adding Microsoft GPG key and installing Visual Studio Code with apt =========="
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -y code

echo "adding GitHub CLI key and installing gh with apt =========="
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# https://docs.docker.com/engine/install/ubuntu/
echo "adding Docker key, installing docker with apt, and setting up docker group"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# Note: The lsb_release -cs sub-command below returns the name of your Ubuntu distribution, such as xenial. Sometimes,
# in a distribution like Linux Mint, you might need to change $(lsb_release -cs) to your parent Ubuntu distribution.
# For example, if you are using Linux Mint Tessa, you could use bionic.
# Docker does not offer any guarantees on untested and unsupported Ubuntu distributions.
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
# https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER

echo "apt autoremoving programs =========="
sudo apt autoremove -y

# USER SECTION ==========
echo "finding latest nvm release =========="
NVM_LATEST_RELEASE=$(curl https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq '.tag_name' --raw-output)
echo "installing latest nvm release: $NVM_LATEST_RELEASE =========="
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_LATEST_RELEASE/install.sh | bash
echo "installing the latest version of node =========="
# manually load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
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
echo
echo "copy the below generated public key to put in GitHub settings: =========="
cat ~/.ssh/id_ed25519_github.pub
echo
read -p "Press ENTER when done: "

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

source ~/.bashrc


# Manual Installs ==========

# ngrok https://ngrok.com/download
echo
echo "TODO: Install ngrok"
echo "1. Go here: https://ngrok.com/download and click Download for Linux"
echo "2. Unzip download: unzip ~/Downloads/ngrok-stable-linux-amd64.zip"
echo "3. Move to /usr/local/bin: sudo mv ~/Downloads/ngrok /usr/local/bin"
read -p "Press ENTER when done: "
