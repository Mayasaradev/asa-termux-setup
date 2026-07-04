# asa termux setup

setup:
```
cd
pkg install git
git clone https://github.com/Mayasaradev/asa-setup-termux
cd asa-setup-termux && bash command.txt && cd && rm -rf asa-setup-termux
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
