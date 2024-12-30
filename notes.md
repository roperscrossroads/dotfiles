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