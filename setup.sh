# create .trash if required
mkdir -p ~/.trash

# create ./old
mkdir -p ./old

# config files
files=(.bash_profile .bashrc .bash_aliases .screenrc .emacs.d)

for f in "${files[@]}"
do
    # move old config files to ./old
    mv ~/$f ./old
    # create symbolic link to the new config file
    ln -sb ~/dotfiles/$f ~
done
