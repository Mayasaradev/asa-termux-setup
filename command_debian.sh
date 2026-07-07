apt update && apt upgrade -y
apt install nala -y
nala install -y python3 git tree vim nano wget neofetch curl tar xz-utils zsh

ARCH=$(uname -m)
if [ "$ARCH" = "aarch64" ]; then ARCH="arm64"; else ARCH="x86_64"; fi
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-${ARCH}.tar.gz
tar xzvf nvim-linux-${ARCH}.tar.gz
rm -rf /opt/nvim
mv nvim-linux-${ARCH} /opt/nvim
ln -sf /opt/nvim/bin/nvim /usr/bin/nvim

chsh -s zsh

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

PROMPT=$'%F{blue}%F{red}┌──(%F{blue}%n@debian%F{red})-[%F{white}%*%F{red}]-[%F{white}%~%F{red}]${vcs_info_msg_0_}\n└─%F{blue}❯ %f'

alias up="nala update && nala upgrade -y"
alias in="nala install -y"
alias cls='clear'
alias rl='source ~/.zshrc'
alias zshrc='nvim ~/.zshrc'
alias x='exit'

neofetch --ascii_distro kali 2>/dev/null || true

EOF
