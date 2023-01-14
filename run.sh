#! /bin/zsh

touch $HOME/.hushlogin

echo 'syntax enable
set tabstop=4
set softtabstop=4
set expandtab
set number
set showmatch
set incsearch' >> $HOME/.vimrc

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install --cask iterm2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install romkatv/powerlevel10k/powerlevel10k
echo '
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme' >> $HOME/.zshrc

brew install z
echo '
. /opt/homebrew/etc/profile.d/z.sh' >> $HOME/.zshrc

brew install --cask brave-browser
brew install pass
gpg --full-generate-key

ssh-keygen -t ed25519 -C "filipegsantoss@gmail.com"

brew install git
git config --global core.editor vim
git config --global init.defaultBranch main
git config --global alias.dog "log --decorate --oneline --graph"
brew install gh

brew install --cask visual-studio-code
brew install --cask stats
brew install --cask docker
brew install --cask google-chrome
brew install --cask discord
brew install --cask zoom

brew install postgresql@13
echo '
export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"' >> $HOME/.zshrc

brew install nvm
mkdir $HOME/.nvm
echo '
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc' >> $HOME/.zshrc
source $HOME/.zshrc
nvm install --lts

brew install rafttio/tap/raftt
brew install skaffold
brew install helm
brew install sops
brew install age
helm plugin install https://github.com/jkroepke/helm-secrets
mkdir -p $HOME/Library/Application\ Support/sops/age
brew install minikube
minikube config set driver docker
minikube start
minikube addons enable ingress
minikube addons enable dashboard

brew install awscli
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
terraform -install-autocomplete

brew install cocoapods
brew install --cask flutter
sudo softwareupdate --install-rosetta --agree-to-license
dart pub global activate fvm
echo '
export PATH="$PATH":"$HOME/.pub-cache/bin"' >> $HOME/.zshrc

sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

open -a Simulator.app
