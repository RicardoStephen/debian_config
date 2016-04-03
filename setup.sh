# create .trash if required
if [ ! -d "~/.trash" ]; then
    mkdir ~/.trash
fi

# create ./old
if [ ! -d "./old" ]; then
    mkdir old
fi

# move old config files to ./old
if [ -e "~/.bashrc" ]; then
    mv ~/.bashrc ./old
fi
if [ -e "~/.bash_aliases" ]; then
    mv ~/.bash_aliases ./old
fi
if [ -e "~/.screenrc" ]; then
    mv ~/.screenrc ./old
fi

# create symbolic links
ln -sb ./bashrc ~
ln -sb ./bash_aliases ~
ln -sb ./screenrc ~
