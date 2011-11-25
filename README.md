How to install my configs
=========================
1. Clone my repository with configs:

    ```
    git@github.com:tarmolov/configs.git ~/.hevil-configs
    ```

2. Setup simlinks on my .vimrc and .screenrc:

    ```
    cd ~
    ln -s .hevil-configs/.vimrc .
    ln -s .hevil-configs/screenrc .
    ```

3. Setup Vundle:

    ```
    git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ```

4. Install configured bundles:

    Launch `vim`, run `:BundleInstall`.

Enjoy! :)
