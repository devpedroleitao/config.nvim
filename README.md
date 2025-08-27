# config.nvim
Configuration for NeoVim

Create a folder in your home ~/.config/ and put the nvim folder there

Need to run:
1. sudo apt-get update
2. sudo apt-get install build-essentials
3. Install .zsh sudo apt-get zsh && chsh -s $(which zsh)
4. Install oh-my-zsh https://ohmyz.sh/#install.
5. Install zsh-autosuggestion git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
6. Install tmux apt install tmux
7. Install zoxide https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation.
8. Install cargo https://doc.rust-lang.org/cargo/getting-started/installation.html.
9. Install brew /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
10. Install rg grep. Brew install ripgrep.
11. Install fzf brew install fzf
12. Install packer requirements git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
13. Open lua/pedroleitao/packer.lua and run :PackerSync
14. Copy the fonts folder content into C:/Windows/Fonts
15. On Windows Terminal edit the current font and select JetbrainsMono
16. On Windows Terminal actions remove the CTRL+V to paste. Instead we always use CTRL+SHIFT+V to paste because Vim usese CTRL+V to Visual Block Mode.
17. Update git core editor -- git config --global --add core.editor "nvim"
18. Add ~/.local/bin to $PATH
19. Cp tmux-sessionizer and cht.sh to ~/.local/bin
