#!/bin/sh

brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

brew install ripgrep
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install the_silver_searcher
brew install fd
