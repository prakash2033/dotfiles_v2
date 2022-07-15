### Aliases and Functions are usually in:
    bashrc
    function
    scripts
    zshrc

![alt text](http://i.imgur.com/EcQoF8a.gif)

### Fresh Install Info

    # Debian/Ubuntu/Pop-OS
    sudo apt install git stow mpv coreutils xdotool sxiv cmus htop newsboat jq fzf yt-dlp dmenu qpdfview task-spooler
    sudo apt install xcb libxcb-util0-dev libxcb-cursor-dev
    sudo apt install python3-pip
    pip3 install ueberzug
    
    git clone https://github.com/pystardust/ytfzf
    cd ytfzf
    sudo make install doc
    
    # Arch
    sudo pacman -S git stow mpv coreutils xdotool sxiv cmus htop newsboat jq fzf yt-dlp dmenu ueberzug ytfzf qpdfview
    yay -S task-spooler
    yay -S wmutils-git
    yay -S nvm
    yay -S ytfzf
    
    mkdir -p ~/Public/gitrepo 
    cd ~/Public/gitrepo
    git clone https://github.com/prakash2033/dotfiles_v2.git
    git clone https://github.com/so-fancy/diff-so-fancy.git
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    git clone https://github.com/prakash2033/shownotes.git
    git clone https://github.com/michael-lazar/rtv.git
    cd rtv
    python setup.py install

    ## symlink all folders (trailing slash */) in dotfiles dir to home dir
    cd ~/Public/gitrepo/dotfiles_v2/normal_user
    stow -v -t ~ */

    # change to zsh shell
    sudo pacman -S zsh zsh-completions
    chsh -s /usr/bin/zsh

    # vim plug install. Run :PlugInstall inside vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    ## if new folder is added then:
    # redo link (-R)
    cd ~/Public/gitrepo/dotfiles_v2/normal_user
    stow -v -R -t ~ */
    stow -v -R -t ~ tmux
    
    ## if folder was deleted then:
    # delete (-D flag then -R to relink)
    cd ~/Public/gitrepo/dotfiles_v2/normal_user
    stow -v -D -t ~ */
    stow -v -R -t ~ */

----

                 _   _     _      _
      __ _  ___ | |_| |__ | | ___| |_ _   _
     / _` |/ _ \| __| '_ \| |/ _ \ __| | | |
    | (_| | (_) | |_| |_) | |  __/ |_| |_| |
     \__, |\___/ \__|_.__/|_|\___|\__|\__,_|
     |___/

- http://www.youtube.com/user/gotbletu
- https://lbry.tv/@gotbletu
- https://twitter.com/gotbletu
- https://github.com/gotbletu
