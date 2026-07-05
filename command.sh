#!/data/data/com.termux/files/usr/bin/bash
pkg update
pkg upgrade -y
pkg install git wget tree neovim nano vim python openssh nodejs termux-api gh zsh rust neofetch nodejs-lts termux-tools lazygit ripgrep fzf fd clang ruff lua-language-server luarocks -y

chsh -s zsh

termux-setup-storage

# LazyVim
mkdir -p ~/.config
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# extra-keys Termux
mkdir -p ~/.termux
printf "extra-keys = [['ESC','/','-','HOME','UP','END','PGDN'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGUP']]\n" >~/.termux/termux.properties
termux-reload-settings

# .zshrc Kali
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

neofetch --ascii_distro kali 2>/dev/null || true
EOF

echo "Selesai! Restart Termux."
