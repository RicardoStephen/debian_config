# track current directory
DIR=`pwd`

# create .trash if required
mkdir -p ~/.trash

# create ./old
mkdir -p $DIR/old

# customization file
touch .custom

# config files
# files=(.bash_profile .bashrc .bash_aliases .screenrc .emacs.d .custom)
files=(.bash_aliases .screenrc)

for f in "${files[@]}"
do
    # move old config files to ./old
    mv ~/$f $DIR/old
    # create symbolic link to the new config file
    ln -sb $DIR/$f ~
done
