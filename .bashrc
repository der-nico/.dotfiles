# .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
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
export EDITOR=nvim
setopt CHASE_LINKS
unset CDPATH

alias cd='>/dev/null cd'
alias realvim="\vim"
alias vim="nvim"
alias ll="ls -lahtr"
alias vimpy="vimx --cmd 'let include_pymode=1'"
alias ag='ag --path-to-ignore ~/.ignore'
alias edithistory="vim ~/.bash_history"
function viag () { vim -c "Ack! $*" }
alias vimag="viag"
alias pe='~/go/bin/path-extractor'
tmux_helper(){
 print -z vim $a
}

alias pp_test="tmux capture-pane -p -S -3000 > $HOME/step_1.txt; tac $HOME/step_1.txt | grep '.' > $HOME/step_2.txt; cat $HOME/step_2.txt | grep -v ' \\$ ' > $HOME/step_3.txt; cat $HOME/step_3.txt | grep -v ' \\\$\$' > $HOME/step_4.txt; cat $HOME/step_4.txt | grep -v ^' 'nscharmb > $HOME/step_5.txt; cat $HOME/step_5.txt | pe >$HOME/tmux-buffer ; cat -n $HOME/tmux-buffer > $HOME/step_6.txt; cat $HOME/step_6.txt | sort -uk2 > $HOME/step_7.txt; cat $HOME/step_7.txt | sort -nk1 > $HOME/step_8.txt; cat $HOME/step_8.txt | cut -f2- > $HOME/tmux-buffer; cat $HOME/tmux-buffer > $HOME/step_9.txt; cat $HOME/step_9.txt | ag --nobreak --nonumbers --noheading . > $HOME/step_10.txt; cat $HOME/step_10.txt | fzf --height 20% > $HOME/step_11.txt; cat $HOME/step_11.txt | xargs echo -n > $HOME/step_12.txt; cat $HOME/step_12.txt | read a ; tmux_helper"
alias pp="tmux capture-pane -p -S -3000 > $HOME/tmux-buffer; tac $HOME/tmux-buffer | grep '.' | grep -v ' \\$ ' | grep -v ' \\\$\$' | grep -v ^' 'nscharmb | pe >$HOME/tmux-buffer ; cat -n $HOME/tmux-buffer | sort -uk2 | sort -nk1 | cut -f2- > $HOME/tmux-buffer; cat $HOME/tmux-buffer | ag --nobreak --nonumbers --noheading . | fzf --height 20% | xargs echo -n | read a ; tmux_helper"



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
# Remove duplicate entries if HIST_FIND_NO_DUPS is set.
if [[ -o HIST_FIND_NO_DUPS ]]; then
    local -A unique_matches
    for n in $_history_substring_search_matches; do
        unique_matches[${history[$n]}]="$n"
    done
    _history_substring_search_matches=(${(@no)unique_matches})
fi

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda context dir rbenv dir_writable vcs newline os_icon)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs command_execution_time status vi_mode)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_PYTHON_ICON=''
POWERLEVEL9K_ANACONDA_BACKGROUND='black'
POWERLEVEL9K_ANACONDA_FOREGROUND='cyan'
# Advanced `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'

# Advanced `vi_mode` color customization
# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='cyan'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='green'


# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
    git
)
export KEYTIMEOUT=10
source $ZSH/oh-my-zsh.sh

if [ ${HOST:0:6} = "lxplus" ] || [ ${HOST:0:4} = "pc20" ]; then
  alias setupPandas="source ~/private/tools/setup/SetupPandas.sh"
  alias setupLatex="source ~/private/tools/setup/SetupLatex.sh"
  alias setupQC="source ~/private/tools/setup/SetupQC.sh"
  alias ls="ls --color=auto"
  LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
  export LS_COLORS
  scpo() {
      save_path="macbook:tmp/"
      file_names=()
      for file in "$@"
      do
          IFS='/' read -A my2array <<< "$file"
          file_names+=("${my2array[@]:(-1)}")
      done
      scp "$@" "$save_path"
      IFS=':' read -A myarray <<< "$save_path"
      echo ${file_names[@]}
      echo ${myarray[2]%$1}
      ssh macbook "cd ${myarray[2]%$1}; open -g ${file_names[@]};"
  }
  if [ ${HOST:0:6} = "lxplus" ]; then
    alias cdeos="/eos/user/n/nscharmb/"
    alias cdwork="/afs/cern.ch/work/n/nscharmb/"
    alias ktmux="k5reauth -f -i 3600 -p nscharmb -k ~/private/tools/nscharmb.keytab -- tmux"
    alias reauth="k5reauth -f -x -k ~/private/tools/nscharmb.keytab"
    setupATLAS
    lsetup git
    # Define Colors and Background colors
    BLACK='\033[01;30m'
    RED='\033[01;31m'
    GREEN='\033[01;32m'
    YELLOW='\033[01;33m'
    BLUE='\033[01;34m'
    bgBLACK='\033[01;40m'
    bgRED='\033[01;41m'
    bgGREEN='\033[01;42m'
    bgYELLOW='\033[01;43m'
    bgBLUE='\033[01;44m'
    declare -a used_quota=("70" "75" "80" "85" "88" "90" "92" "94" "96" "97" "98" "99" )
    # declare -a used_quota=("17" "17" "18" "18" "18" "19" "19" "19" "19" "19" "19" "19" )
    declare -a colors=( "$GREEN" "$BLUE" "$YELLOW" "$RED" "$GREEN" "$BLUE" "$BLACK" "$RED" "$GREEN" "$BLUE" "$YELLOW" "$RED" )
    declare -a bg_colors=( "$bgBLACK" "$bgBLACK" "$bgBLACK" "$bgBLACK" "$bgYELLOW" "$bgYELLOW" "$bgYELLOW" "$bgYELLOW" "$bgRED" "$bgRED" "$bgRED" "$bgRED")
    for ((i = 1; i <= ${#used_quota[@]}; ++i)); do \
      space=${used_quota[$i]};
      color=${colors[$i]}${bg_colors[$i]};
      printtext="Warning your home directory is more than "$space"% full"
      fs listquota | grep user.nscharmb | awk -v c=$color -v nc="\033[0m" -v t=$printtext '$4>'$space' {print c,t,"("$4")",nc}'
    done
  else # for manchester machines
    # alias setupafs='kinit nscharmb@CERN.CH; aklog -cell cern.ch'
    function setupafs {
      kinit nscharmb@CERN.CH;
      aklog -cell cern.ch;
      echo -e "Setting TEX environment";
      # set TEX directory for lxplus
      export PATH="/afs/cern.ch/sw/XML/texlive/2016/bin/x86_64-linux:$PATH"
      echo -e "Setting conda python pathes for nvim";
      export ConndaPYTHONPATHMAIN="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/ring_tools/bin/python"
      export ConndaPYTHON3PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/neovim3/bin/python"
      export ConndaPYTHON2PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/neovim2/bin/python"
    }
    # export PATH="$PATH:/afs/cern.ch/work/n/nscharmb/anaconda3/bin/"
    alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'
    if [ -n ${HACKFOROLD_AtlasSetup+x} ]; then export AtlasSetup="$HACKFOROLD_AtlasSetup"; fi
    if [ -n ${HACKFOROLD_AtlasSetup+x} ]; then export AtlasSetupSite="$HACKFOROLD_AtlasSetupSite"; fi
    source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh
    export HACKFOROLD_AtlasSetup="$AtlasSetup"
    export HACKFOROLD_AtlasSetupSite="$AtlasSetupSite"
    lsetup git
    alias setupTrexFitter="source ~/private/tools/setup/SetupTrexFitter.sh"
    alias setupTTHbbAnalysis="source ~/private/tools/setup/SetupTTHbbAnalysis.sh"
    # alias ag='/afs/cern.ch/work/n/nscharmb/anaconda3/bin/ag --path-to-ignore ~/.ignore'
  fi
else
    alias mounthiggs="sshfs -o allow_other,defer_permissions nico@higgs.hep.manchester.ac.uk: mount/"
    alias mountlxplus="sshfs -o allow_other,defer_permissions nscharmb@lxplus.cern.ch: mount/"
    alias mounteve="sshfs -o allow_other,defer_permissions nscharmb@eve.e5.physik.tu-dortmund.de: mount/"
    alias vim="~/./nvim-osx64/bin/nvim"
    alias ls="ls -G"
    LSCOLORS="exfxcxdxbxegedabagacad"
    export LSCOLORS
fi

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
zstyle ':completion:*' special-dirs true
zle -N zle-line-init
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

function color_test {
  #   Daniel Crisman's ANSI color chart script from
  #   The Bash Prompt HOWTO: 6.1. Colours
  #   http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
  #  
  #   This function echoes a bunch of color codes to the 
  #   terminal to demonstrate what's available.  Each 
  #   line is the color code of one forground color,
  #   out of 17 (default + 16 escapes), followed by a 
  #   test use of that color on all nine background 
  #   colors (default + 8 escapes).
  #
  T='gYw'   # The test text
  echo -e "\n         def     40m     41m     42m     43m     44m     45m     46m     47m";
  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
             '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
             '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
    echo;
  done
  echo
}
# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi
set -o vi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
