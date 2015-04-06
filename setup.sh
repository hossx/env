rm ~/.vimrc
rm ~/.chm.vim
rm ~/.bashrc
rm ~/.gitconfig
ln -s ~/env/.vimrc ~/
ln -s ~/env/.chm.vim ~/
ln -s ~/env/.bashrc ~/
ln -s ~/env/.gitconfig ~/


if [ ! -d ~/.vim ];
then
    ln -s ~/env/.vim ~/
else
    rm ~/.vim -rf
fi


if [ ! -d ~/bin ];
then
    mkdir ~/bin
fi
