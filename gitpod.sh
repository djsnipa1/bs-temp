#!/usr/bin/env bash

#echo "abbr -e lvim" >>$HOME/.config/fish/config.fish
#echo "abbr -a -- v nvim" >>$HOME/.config/fish/config.fish
#echo "fixed abbrs"

nix-env --install lf lazygit pistol chafa gh eza neovim fish tmux
echo "nix packages"

gh auth setup-git
echo "setup git as me"

gh repo clone lazyvim/starter $HOME/.config/nvim
cp -r nvim $HOME/.config
echo "installed lazyvim"

gp ports visibility 5173:public
gp ports list --no-color

# add tmux plugin
# The file you want to modify
file="$HOME/.tmux_plugins.conf"
# The line you want to add
line="set -g @plugin 'jaclu/tmux-menus'"
# The line number you want to add the line at
line_number=8
# Use sed to insert the line
sed -i "${line_number}i${line}" "$file"
# source tmux config
tmux source-file $HOME/.tmux.conf
