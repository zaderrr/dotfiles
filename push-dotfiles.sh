#!/bin/bash

mkdir ~/dotfiles/.config
cp -r ~/.config/hypr ~/dotfiles/.config
cp -r ~/.config/nvim ~/dotfiles/.config
cp -r ~/.config/waybar ~/dotfiles/.config
cp -r ~/.config/dunst ~/dotfiles/.config
cp -r ~/.zshrc ~/dotfiles
cp -r ~/.config/rofi ~/dotfiles/.config
cp -r ~/.oh-my-zsh/themes/minimalZSH.zsh-theme ~/dotfiles
cd ~/dotfiles

git add .
git commit -m $1
git push origin master

rm -rf ~/dotfiles/.config
rm -rf .zshrc
rm -rf minimalZSH.zsh-theme
