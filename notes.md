    _____________________________________
   / You single-handedly fought your way \
   \ into this hopeless mess.            /
    -------------------------------------
           \   ^__^
            \  (oo)\_______
               (__)\       )\/\
                   ||----w |
                   ||     ||
   Thu Dec  5 12:15:16 PM EST 2024


- https://github.com/bevry/dorothy
- https://github.com/molleweide/dotfiles
- https://github.com/Allaman/nvim
- https://github.com/Allaman/dots
- https://github.com/Piotr1215/dotfiles


cd ~/.local/share/fonts
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar xf JetBrainsMono.tar.xz

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install just
cargo install zoxide
cargo install onefetch
setup-oh-my-zsh

cargo install bob-nvim
bob use stable
ln -s ~/.config/dorothy/config.xdg/nvim/config.lua ~/.config/.nvim_config.lua
#todo ^ move this

cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli
install latest fzf (debian one is old)
install luarocks

https://mise.jdx.dev/installing-mise.html
curl https://mise.jdx.dev/mise-latest-linux-x64 > ~/.local/bin/mise
chmod +x ~/.local/bin/mise

sh <(curl -L https://nixos.org/nix/install) --daemon

https://github.com/sharkdp/fd/releases
https://github.com/BurntSushi/ripgrep

$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
$ sudo dpkg -i ripgrep_14.1.0-1_amd64.deb

nvim
- mkdir -p ~/dev/github.com/roperscrossroads
- git clone git@github.com:Allaman/kustomize.nvim.git ~/dev/github.com/roperscrossroads/kustomize.nvim
- git clone git@github.com:Allaman/emoji.nvim.git ~/dev/github.com/roperscrossroads/emoji.nvim
- nvim
- lazy: install
- checkhealth
- Mason

