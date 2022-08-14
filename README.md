### Aliases and Functions are usually in:
    bashrc
    function
    scripts
    zshrc

![alt text](http://i.imgur.com/EcQoF8a.gif)

### Fresh Install Info

    # Fedora
    sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf install mpv mpv-libs
    sudo dnf install xterm tmux zsh git stow coreutils xdotool sxiv htop newsboat
    sudo dnf install jq fzf yt-dlp dmenu qpdfview task-spooler
    sudo dnf install w3m feh
    
    sudo dnf install libX11-devel libXft-devel libXinerama-devel
    
    ## for wmutils core
    sudo dnf install libxcb-devel xcb-util-keysyms-devel xcb-util-devel xcb-util-wm-devel xcb-util-cursor-devel
    
    # Arch
    sudo pacman -S git stow mpv coreutils xdotool sxiv cmus htop newsboat 
    sudo pacman -S jq fzf yt-dlp dmenu ueberzug ytfzf qpdfview
    yay -S task-spooler wmutils-git nvm ytfzf

    # Debian/Ubuntu/Pop-OS
    sudo apt install xterm tmux zsh -y
    sudo apt install git stow coreutils xdotool sxiv cmus htop newsboat -y
    sudo apt install jq fzf dmenu qpdfview task-spooler -y
    sudo apt install xcb libxcb-util0-dev libxcb-cursor-dev -y
    sudo apt install python3-pip python-is-python3 -y
    sudo apt install w3m surfraw rtv feh -y
    sudo apt install onedrive ranger imagemagick aptitude lynx -y
    sudo apt install bluez blueman -y
    sudo apt install libxext-dev -y
    sudo apt install gvfs-backends -y # for sambha share support in thunar file manager
    sudo apt install fortunes fortunes ## for random quotes
    pip3 install ueberzug
    
    # install separately
    mpv
    
    sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp
    
    ## youtube viewer
    git clone https://github.com/trizen/youtube-viewer.git
    cd youtube-viewer
    cpan Module::Build 
    perl Build.PL
    sudo ./Build installdeps
    sudo ./Build install
    
    # specially for debian 11 bullseye
    sudo apt-get install vim-gui-common
    sudo apt-get install vim-runtime
    sudo apt install vim-nox # works
    
    ## bluetooth device to show in audio settings (pavucontrol)
    printf '[General]
    Enable=Control,Gateway,Headset,Media,Sink,Socket,Source' > /etc/bluetooth/audio.conf 
    
    git clone https://github.com/pystardust/ytfzf
    cd ytfzf
    sudo make install doc
    
    git clone https://github.com/wmutils/core
    cd core
    sudo make
    sudo make install
    
    ## For GUI Display managers. Add it in autostart to load Xresources
    /usr/bin/xrdb /home/pvishwa1/.Xresources
    
    mkdir -p ~/Public/gitrepo 
    cd ~/Public/gitrepo
    git clone https://github.com/prakash2033/dotfiles_v2.git
    git clone https://github.com/so-fancy/diff-so-fancy.git
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    git clone https://github.com/prakash2033/shownotes.git
    git clone https://github.com/michael-lazar/rtv.git
    cd rtv
    sudo python setup.py install
    
    # change to zsh shell
    sudo pacman -S zsh zsh-completions
    chsh -s /usr/bin/zsh

    # vim plug install. Run :PlugInstall inside vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    ## symlink all folders (trailing slash */) in dotfiles dir to home dir
    cd ~/Public/gitrepo/dotfiles_v2/normal_user
    stow -v -t ~ */

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
