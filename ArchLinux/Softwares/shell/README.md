# My shell configuration on ArchLinux
## Install zsh

    sudo pacman -S zsh zsh-completions

## Install oh-my-zsh

    sudo pacman -S curl
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Change the zsh theme
Edit the file ~/.zshrc and replace

    ZSH_THEME="robbyrussell"

with

    ZSH_THEME="dracula"

Don't forget to download the dracula theme for zsh first.

