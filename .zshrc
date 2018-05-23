# !./.zshrc
# export LANG="en_US.UTF-8"
### Source global definitions
if [ -f /etc/zshrc ]; then
        . /etc/zshrc
fi

_has() {
  return $( whence $1 >/dev/null )
}
# User specific aliases and functions
#alias SetupAnalysisTop_2_4_24=cd private/Atlas/Analysis/AnalysisTop-2.4.24/; source setup.sh; rcSetup Top,2.4.24; rc find_packages; rc compile
#. /afs/cern.ch/sw/lcg/external/gcc/4.9/x86_64-slc6-gcc49-opt/setup.sh
#. /afs/cern.ch/sw/lcg/app/releases/ROOT/6.05.02/x86_64-slc6-gcc49-opt/root/bin/thisroot.sh

function update-x11-forwarding
{
      if [ -z "$STY" -a -z "$TMUX" ]; then
                echo $DISPLAY > ~/.display.txt
      else
                export DISPLAY=`cat ~/.display.txt`

      fi
    }
# ZLE_RPROMPT_INDENT=-1
if [ ${HOST:0:6} = "lxplus" ]; then
    export PATH=/afs/cern.ch/sw/XML/texlive/2016/bin/x86_64-linux:$PATH
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/lib
    export ConndaPYTHONPATHMAIN="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/ring_tools/bin/python"
    export ConndaPYTHON3PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/neovim3/bin/python"
    export ConndaPYTHON2PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/neovim2/bin/python"
    export PATH="$HOME/neovim/bin:$PATH"
    alias cdeos="/eos/user/n/nscharmb/"
    alias cdwork="/afs/cern.ch/work/n/nscharmb/"
    alias ktmux="k5reauth -f -i 3600 -p nscharmb -k ~/private/tools/nscharmb.keytab -- tmux"
    alias reauth="k5reauth -f -x -k ~/private/tools/nscharmb.keytab"
    alias setupPandas="source ~/private/tools/setup/SetupPandas.sh"
    alias setupLatex="source ~/private/tools/setup/SetupLatex.sh"
    alias setupQC="source ~/private/tools/setup/SetupQC.sh"
    alias ls="ls --color=auto"
    LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
    export LS_COLORS

    for space in 75 80 85 88 90 92 94 96 97 98 99
    do
        fs listquota | grep user.nscharmb | awk '$4>'$space' {print "Warning your home directory is more than '$space'% full"}'
    done
else
    export PATH="$HOME/nvim-osx64/bin:$PATH"
	export PATH="/Users/nicolasscharmberg/anaconda3/bin:$PATH"
    export ConndaPYTHONPATHMAIN="/Users/nicolasscharmberg/anaconda3/bin/python"
    export ConndaPYTHON3PATH="/Users/nicolasscharmberg/anaconda3/envs/neovim3"
    export ConndaPYTHON2PATH="/Users/nicolasscharmberg/anaconda3/envs/neovim2"
    alias mounthiggs="sshfs -o allow_other,defer_permissions nico@higgs.hep.manchester.ac.uk: mount/"
    alias mountlxplus="sshfs -o allow_other,defer_permissions nscharmb@lxplus.cern.ch: mount/"
    alias mounteve="sshfs -o allow_other,defer_permissions nscharmb@eve.e5.physik.tu-dortmund.de: mount/"
    alias vim="~/./nvim-osx64/bin/nvim"
    alias ls="ls -G"
    LSCOLORS="exfxcxdxbxegedabagacad"
    export LSCOLORS
fi
export PATH=$HOME/bin:$PATH
# added by Anaconda3 4.3.0 installer
#export PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/bin:$PATH"
# alias vim="vimx"
setopt CHASE_LINKS
# CDPath option breaks some shell scripts
# export CDPATH=$CDPATH:.:~/private/symlinks
unset CDPATH

alias cd='>/dev/null cd'
alias realvim="\vim"
alias vim="nvim"
alias ll="ls -lahtr"
alias vimpy="vimx --cmd 'let include_pymode=1'"
alias ag='ag --path-to-ignore ~/.ignore'
function viag () { vim -c "Ack! $*" }
alias vimag="viag"
alias pe='~/go/bin/path-extractor'

tmux_helper(){
 print -z vim $a
}

alias pp="tmux capture-pane -p -S -3000 > $TMPDIR/tmux-buffer; tac $TMPDIR/tmux-buffer | grep '.' | grep -v ' \\$ ' | grep -v ' \\\$\$' | grep -v ^' 'nscharmb | pe >$TMPDIR/tmux-buffer ; cat -n $TMPDIR/tmux-buffer | sort -uk2 | sort -nk1 | cut -f2- > $TMPDIR/tmux-buffer; cat $TMPDIR/tmux-buffer | ag --nobreak --nonumbers --noheading . | fzf --height 20% | xargs echo -n | read a ; tmux_helper"

scpo() {
    save_path="macbook:tmp/"
    # if [[ $# -eq 2 ]];
    # then
    #     save_path="$2"
    # fi
    file_names=()
    for file in "$@"
    do
        # scp "$file" "$save_path"
        IFS='/' read -A my2array <<< "$file"
        file_names+=("${my2array[@]:(-1)}")
    done
    scp "$@" "$save_path"

    IFS=':' read -A myarray <<< "$save_path"
    echo ${file_names[@]}
    echo ${myarray[2]%$1}
    # ssh macbook "/usr/local/bin/duti -s com.apple.preview .pdf all; cd" "${myarray[1]%$1}" '; open -g' "${file_names[@]}" '; /usr/local/bin/duti -s com.adobe.Reader .pdf all'
    ssh macbook "cd ${myarray[2]%$1}; open -g ${file_names[@]};"
}
export EDITOR=nvim


# COMPLETION_WAITING_DOTS="true"
# ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
# Find all occurrences of the search query in the history file.
#
# (k) turns it an array of line numbers.
#
# (on) seems to remove duplicates, which are default
#      options. They can be turned off by (ON).
#
_history_substring_search_matches=(${(kon)history[(R)(#$HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS)*${_history_substring_search_query_escaped}*]})
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# --8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--
# Remove duplicate entries if HIST_FIND_NO_DUPS is set.
if [[ -o HIST_FIND_NO_DUPS ]]; then
    local -A unique_matches
    for n in $_history_substring_search_matches; do
        unique_matches[${history[$n]}]="$n"
    done
    _history_substring_search_matches=(${(@no)unique_matches})
fi
# --8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--

#
# Define the range of values that $_history_substring_search_match_index


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=${HOME}/.oh-my-zsh
  ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv dir_writable os_icon)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda context dir rbenv dir_writable newline os_icon)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs command_execution_time status vi_mode)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_PYTHON_ICON=''
POWERLEVEL9K_ANACONDA_BACKGROUND='black'
POWERLEVEL9K_ANACONDA_FOREGROUND='cyan'
# Advanced `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

# Advanced `vi_mode` color customization
# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='cyan'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='green'

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    vi-mode
    z
    bundler
    dotenv
    osx
    rake
    rbenv
    ruby
)
export KEYTIMEOUT=10
source $ZSH/oh-my-zsh.sh

zle -N zle-keymap-select
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    if [[ -z $TMUX ]]; then
        case $KEYMAP in
            vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
            viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
        esac
    else
        case $KEYMAP in
            # printf "\033Ptmux;\033\033[2 q\033\\"
            vicmd)      print -n -- "\EPtmux;\E\E]50;CursorShape=0\x7\E\\";;  # block cursor
            viins|main) print -n -- "\EPtmux;\E\E]50;CursorShape=1\x7\E\\";;  # line cursor
        esac
    fi

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#     RPS2=$RPS1
#     zle reset-prompt
# }
zstyle ':completion:*' special-dirs true
zle -N zle-line-init
# zle -N zle-keymap-select
bindkey -a '^[[3~' delete-char
bindkey '^[[3~' delete-char
# bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward
# bindkey -M vicmd 'v' edit-command-line
bindkey -M vicmd '^V' edit-command-line
bindkey -M vicmd 'v' vi-cmd-mode
bindkey jk vi-cmd-mode
source ${HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias grep="grep --color=auto"
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
# autoload -Uz compinit
# compinit


# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  # export FZF_DEFAULT_OPTS='
  # --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  # --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  # '
fi
# compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
set -o vi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
