#!/bin/bash

\cp -r ./alacritty/ "$HOME/.config/"
\cp -r ./tmux/.tmux.conf "$HOME/"
\cp -r ./zsh/.zshrc "$HOME/"
\cp -r ./zsh/.p10k.zsh "$HOME/"
\cp -r ./nvim/ "$HOME/.config/"

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
git clone https://github.com/asrul10/nvchad-custom.git ~/.config/nvim/lua/custom
