#!/bin/sh
if [ $1 = "modules" ]; then
    git submodule init
    git submodule update
fi
mkdir -p ~/.local/share/nvim/site/pack/plugins
ln -s "$(pwd)/plugins" ~/.local/share/nvim/site/pack/plugins/start
