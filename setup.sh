# create .trash if required
mkdir -p ~/.trash

# create ./old
mkdir -p ./old

# move old config files to ./old
if [ -e "~/.bash_profile" ]; then
    mv ~/.bash_profile ./old
fi
if [ -e "~/.bashrc" ]; then
    mv ~/.bashrc ./old
fi
if [ -e "~/.bash_aliases" ]; then
    mv ~/.bash_aliases ./old
fi
if [ -e "~/.screenrc" ]; then
    mv ~/.screenrc ./old
fi
if [ -e "~/.emacs.d" ]; then
    mv ~/.emacs.d ./old
fi

# create symbolic links
ln -sb ~/dotfiles/.bash_profile ~
ln -sb ~/dotfiles/.bashrc ~
ln -sb ~/dotfiles/.bash_aliases ~
ln -sb ~/dotfiles/.screenrc ~
ln -sb ~/dotfiles/.emacs.d ~
