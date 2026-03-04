#!/bin/bash

mkdir ~/dotfiles/.config
cp -r ~/.config/hypr ~/dotfiles/.config
cp -r ~/.config/zellij ~/dotfiles/.config
cp -r ~/.config/nvim ~/dotfiles/.config
cp -r ~/.config/waybar ~/dotfiles/.config
cp -r ~/.config/dunst ~/dotfiles/.config
cp -r ~/.zshrc ~/dotfiles
cp -r ~/.config/rofi ~/dotfiles/.config
cp -r ~/.oh-my-zsh/themes/minimalZSH.zsh-theme ~/dotfiles
cd ~/dotfiles

git add . 
git status

read -p "Happy to commit? > " confirmCommit
if [[ "$confirmCommit" == "y" ]]; then
    read -p "Commit message > " commitMsg
    
    git commit -m "$commitMsg"
    git push origin master
fi


rm -rf ~/dotfiles/.config
rm -rf .zshrc
rm -rf minimalZSH.zsh-theme
