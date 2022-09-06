export CLICOLOR=1
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
__git_files () { 
    _wanted files expl 'local files' _files     
}

USB_SERIAL=/dev/tty.usbserial-143240
export UIC_ROOT="/Users/svradema/git/uic"
export UIC_RPI_IP="10.160.22.34"
#UIC_RPI_IP="192.168.50.62"
#export GSDK_LOCATION='/Applications/SimplicityStudio.app/Contents/Eclipse/developer/sdks/gecko_sdk_suite/v3.0'
alias scp_uic='scp ${1} pi@$UIC_RPI_IP:/tmp'
alias rdocker="docker run -it --rm --mount type=bind,source=/Applications,target=/Applications --privileged -v $USB_SERIAL:/dev/zwave_usb -v ${UIC_ROOT}:${UIC_ROOT} -w ${UIC_ROOT} uic_armhf "
alias rrdocker="docker run -it --rm --privileged --mount type=bind,source=/Applications,target=/Applications -v ${UIC_ROOT}:${UIC_ROOT} -w ${UIC_ROOT}/build_amd64 uic_amd64"
alias config='cd ${UIC_ROOT}/build && rm -rf ./* && cmake .. -DCMAKE_BUILD_TYPE=Debug && make'
alias b='ninja $1'
alias c='cmake -GNinja -DCMAKE_BUILD_TYPE="Debug" $($HOME/.uic/disable_build_options.sh BUILD_ZPC) ${1} ..'
alias c11='PATH=/usr/local/cxx11/include:/usr/local/cxx11/lib:/usr/local/cxx11/lib/cmake/Boost-1.79.0:/usr/local/cxx11/share/cmake:$PATH c -DCMAKE_C_COMPILER=gcc-11 -DCMAKE_CXX_COMPILER=g++-11 -DASAN=True -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/cxx11'
alias sshb='ssh pi@${UIC_RPI_IP}'
#. "${UIC_ROOT}/scripts/internal/pi_uic.source"
#. "${UIC_ROOT}/scripts/source_env_prompt.sh"
