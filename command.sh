#!/data/data/com.termux/files/usr/bin/bash
pkg update
pkg upgrade -y
pkg install git wget tree neovim nano vim python openssh nodejs termux-api gh zsh rust neofetch termux-tools lazygit ripgrep fzf fd clang ruff lua-language-server luarocks proot-distro -y

chsh -s zsh

termux-setup-storage

# LazyVim
mkdir -p ~/.config
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

cat >~/.zshrc <<'EOF'
clear
autoload -Uz vcs_info
setopt PROMPT_SUBST

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr ' +'
zstyle ':vcs_info:git:*' unstagedstr ' *'
zstyle ':vcs_info:git:*' formats '%F{red}-[%F{red}%b%u%c%F{red}]'

precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%F{red}-[%F{red} %b%u%c%F{red}]'

PROMPT=$'%F{blue}%F{red}┌──(%F{blue}%n@setup%F{red})-[%F{white}%*%F{red}]-[%F{white}%~%F{red}]${vcs_info_msg_0_}\n└─%F{blue}❯ %f'

alias up="pkg update && pkg upgrade -y"
alias in="pkg install -y"
alias cls='clear'
alias rl='source ~/.zshrc'
alias zshrc='nvim ~/.zshrc'
alias x='exit'
alias debian='proot-distro login debian --bind $HOME/.local/share/nvim:/root/.local/share/nvim --bind $HOME/.config/nvim:/root/.config/nvim --bind $HOME/.local/state/nvim:/root/.local/state/nvim --bind $HOME/.cache/nvim:/root/.cache/nvim'

neofetch --ascii_distro kali 2>/dev/null || true

EOF

#install proot-distro debian
if ! proot-distro list | grep -q debian; then
  proot-distro install debian
fi

#debian
proot-distro login debian -- bash -c '
apt update && apt upgrade -y 
apt install curl -y
curl -fsSL https://raw.githubusercontent.com/Mayasaradev/asa-termux-setup/main/command_debian.sh | bash'
