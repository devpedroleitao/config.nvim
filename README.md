# config.nvim
Configuration for NeoVim

Create a folder in your home ~/.config/ and put the nvim folder there

Need to run:
1. sudo apt-get update
2. sudo apt-get install build-essentials
3. Install oh-my-zsh https://ohmyz.sh/#install.
4. Install cargo https://doc.rust-lang.org/cargo/getting-started/installation.html.
5. Install rg grep. Brew install ripgrep.
6. Install zoxide https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation.
3. Install packer requirements git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
4. Open lua/pedroleitao/packer.lua and run :PackerSync
5. Copy the fonts folder content into C:/Windows/Fonts
6. On Windows Terminal edit the current font and select JetbrainsMono
7. On Windows Terminal actions remove the CTRL+V to paste. Instead we always use CTRL+SHIFT+V to paste because Vim usese CTRL+V to Visual Block Mode.
8. Update git core editor
-- git config --global --add core.editor "nvim"
9. Add ~/.local/bin to $PATH
10. Cp tmux-sessionizer and cht.sh to ~/.local/bin
