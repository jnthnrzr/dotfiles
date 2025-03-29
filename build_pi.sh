# Cron jobs
# Daily restarts are set for midnight
# sudo nano /etc/crontab
#
# budget server is set up to start running at 0700
#
# Update and upgrade
sudo apt update && sudo apt full-upgrade -y
sudo apt-get update && sudo apt-get -y upgrade
sudo apt autoremove -y

# Install Oh My Zsh
if [ ! -f "$ZSH/oh-my-zsh.sh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone --depth=1 \
      https://github.com/romkatv/powerlevel10k.git \
      ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Common
sudo apt install -y \
	universal-ctags \
    gpm \
	vim-doc \
	vim-scripts \
	vim \
    tmux \
	git \
    zoxide \
    fzf

# Install Python
sudo apt-get install -y \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libgdbm-dev \
    lzma \
    lzma-dev \
    tcl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    make \
    build-essential \
    ripgrep \
    uuid-runtime \
    openssl

# Pyenv
if [ ! -d "/home/pi/.pyenv" ]; then
    curl https://pyenv.run | bash
else
    pyenv update
fi

# Rustup
if [ $(which rustup) ]; then
    :
else
    curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

# Vim Plug
if [ ! -f ".vim/autoload/plug.vim" ]; then
    curl \
        -fLo .vim/autoload/plug.vim \
        --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
