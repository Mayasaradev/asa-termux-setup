# asa termux setup

setup:
```
apt update && apt full-upgrade -y
pkg install curl -y
curl -fsSL https://raw.githubusercontent.com/Mayasaradev/asa-termux-setup/main/command.sh | bash
```

## Apa yang di-install?

### System update
- `pkg update && pkg upgrade -y`

### Packages
- `git`, `curl`, `wget`, `tree`
- `neovim`, `nano`, `vim`
- `python`, `nodejs`, `rust`
- `openssh`, `termux-api`, `gh`
- `zsh`, `neofetch`

### Shell
- `chsh -s zsh` — jadikan zsh sebagai default shell

### Editor
- LazyVim — `git clone https://github.com/LazyVim/starter ~/.config/nvim`
