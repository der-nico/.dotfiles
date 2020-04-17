# !./.zshrc
# export LANG="en_US.UTF-8"
### Source global definitions
if [ -f /etc/zshrc ]; then
        . /etc/zshrc
fi

_has() {
  return $( whence $1 >/dev/null )
}

function update-x11-forwarding
{
      if [ -z "$STY" -a -z "$TMUX" ]; then
                echo $DISPLAY > ~/.display.txt
      else
                export DISPLAY=`cat ~/.display.txt`

      fi
    }

[ -f ~/.gnupg/gpg-agent.env ] && source ~/.gnupg/gpg-agent.env
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --log-file /tmp/gpg.log --write-env-file ~/.gnupg/gpg-agent.env --pinentry-program /usr/local/bin/pinentry-mac)
fi
voms-proxy-init () {
    /usr/bin/voms-proxy-init $@
    source ~/private/tools/clearlines.sh
}

export EDITOR=nvim
setopt CHASE_LINKS
unset CDPATH

alias cd='>/dev/null cd'
alias realvim="\vim"
alias vim="nvim"
alias vimpy="vimx --cmd 'let include_pymode=1'"
alias ag='ag --path-to-ignore ~/.ignore'
alias rg='~/bin/rg --ignore-file ~/.ignore'
alias edithistory="vim ~/.zhistory"
function viag () { vim -c "Ag $*" }
alias vimag="viag"
alias gvim="git vim"
# alias remux="export DISPLAY=\"`tmux show-env | sed -n 's/^DISPLAY=//p'`\""

#### Somehow breaks prompt
# gvim() {
#   local files
#   IFS=$'\n' files=`git diff --name-status $1 | fzf --height 20% -x -m --ansi | awk '{ print $2 }'`
#   [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
# }

alias pe='~/go/bin/path-extractor'
tmux_helper(){
 print -z vim $a
}

alias pp_test="tmux capture-pane -p -S -3000 > $HOME/step_1.txt; tac $HOME/step_1.txt | grep '.' > $HOME/step_2.txt; cat $HOME/step_2.txt | grep -v ' \\$ ' > $HOME/step_3.txt; cat $HOME/step_3.txt | grep -v ' \\\$\$' > $HOME/step_4.txt; cat $HOME/step_4.txt | grep -v ^' 'nscharmb > $HOME/step_5.txt; cat $HOME/step_5.txt | pe >$HOME/tmux-buffer ; cat -n $HOME/tmux-buffer > $HOME/step_6.txt; cat $HOME/step_6.txt | sort -uk2 > $HOME/step_7.txt; cat $HOME/step_7.txt | sort -nk1 > $HOME/step_8.txt; cat $HOME/step_8.txt | cut -f2- > $HOME/tmux-buffer; cat $HOME/tmux-buffer > $HOME/step_9.txt; cat $HOME/step_9.txt | ag --nobreak --nonumbers --noheading . > $HOME/step_10.txt; cat $HOME/step_10.txt | fzf --height 20% > $HOME/step_11.txt; cat $HOME/step_11.txt | xargs echo -n > $HOME/step_12.txt; cat $HOME/step_12.txt | read a ; tmux_helper"
# alias pp="tmux capture-pane -p -S -3000 > $HOME/tmux-buffer; tac $HOME/tmux-buffer | grep '.' | grep -v ' \\$ ' | grep -v ' \\\$\$' | grep -v ^' 'nscharmb | pe >$HOME/tmux-buffer ; cat -n $HOME/tmux-buffer | sort -uk2 | sort -nk1 | cut -f2- > $HOME/tmux-buffer; cat $HOME/tmux-buffer | ag --nobreak --nonumbers --noheading . | fzf --height 20% | xargs echo -n | read a ; tmux_helper"
alias pp="tmux capture-pane -S -3000 && tmux save-buffer $HOME/tmux-buffer && tac $HOME/tmux-buffer > $HOME/tmux-buffer_rev && cat -n $HOME/tmux-buffer_rev | grep '.' | grep -v ' \\$ ' | grep -v ' \\\$\$' | grep -v '' | sort -uk2 | sort -nk1 | pe | fzf --height 20% | xargs echo -n | read a ; tmux_helper"
alias timytime="top -i -b -n1 -U nscharmb | grep nscharmb | awk '{split(\$11, t, \":\"); printf \"%-15s %4d:%02d:%02d (hh:mm:ss)\n\", \$12, int(t[1]/60), t[1]%60, t[2] }' | fzf --height 20% "



export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don\'t record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don\'t record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don\'t write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don\'t execute immediately upon history expansion.
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

ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

export KEYTIMEOUT=10

if [ ${HOST:0:6} = "lxplus" ] || [ ${HOST:0:4} = "pc20" ]; then
  alias setupTrexFitter="source ~/private/Atlas/Analysis/ttH/TRExFitter/setup.sh"
  alias setupTTHbbAnalysis="source ~/private/Atlas/Analysis/ttH/setup.sh"
  alias setupPandas="source ~/private/tools/setup/SetupPandas.sh"
  alias setupLatex="source ~/private/tools/setup/SetupLatex.sh"
  alias setupQC="source ~/private/tools/setup/SetupQC.sh"
  alias ls="ls --color=auto"
  LS_COLORS="di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=30;43:"
  export LS_COLORS
  scpp() {
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
    }
  scpo() {
      save_path="macbook:tmp/"
      file_names=()
      npdfs=0
      for file in "$@"
      do
          IFS='/' read -A my2array <<< "$file"
          file_names+=("${my2array[@]:(-1)}")
          if [ "${${my2array[@]:(-1)}##*.}" = "pdf" ]; then
            npdfs=$((npdfs+1))

          fi
      done
      scp "$@" "$save_path"
      IFS=':' read -A myarray <<< "$save_path"
      echo ${file_names[@]}
      echo ${myarray[2]%$1}
      do_open=true

      if (( npdfs < 3 )); then #Only open the files when not more then 2 pdfs are contained
        ssh macbook "cd ${myarray[2]%$1}; open -g ${file_names[@]};"
      fi
  }
  if [ ${HOST:0:6} = "lxplus" ]; then
    alias cdeos="/eos/user/n/nscharmb/"
    alias cdwork="/afs/cern.ch/work/n/nscharmb/"
    alias ktmux="echo $HOST >>$HOME/tmux-sessions; k5reauth -f -i 3600 -p nscharmb -k ~/private/tools/nscharmb.keytab -- tmux"
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
      if [ -r /afs/cern.ch/user/n/nscharmb/.bash_profile ]; then
        echo -e "Setting LXPLUS path to my homedirectory on lxplus";
        export LXPLUS="/afs/cern.ch/user/n/nscharmb"
        echo -e "Setting TEX environment";
        # set TEX directory for lxplus
        export PATH="/afs/cern.ch/sw/XML/texlive/2016/bin/x86_64-linux:$PATH"
        echo -e "Setting conda python pathes for nvim";
        export ConndaPYTHONPATHMAIN="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/ring_tools/bin/python"
        export ConndaPYTHON3PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/neovim3/bin/python"
        export ConndaPYTHON2PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/neovim2/bin/python"
      fi
    }
    # export PATH="$PATH:/afs/cern.ch/work/n/nscharmb/anaconda3/bin/"
    alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'
    if [ -n ${HACKFOROLD_AtlasSetup+x} ]; then export AtlasSetup="$HACKFOROLD_AtlasSetup"; fi
    if [ -n ${HACKFOROLD_AtlasSetup+x} ]; then export AtlasSetupSite="$HACKFOROLD_AtlasSetupSite"; fi
    source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh
    export HACKFOROLD_AtlasSetup="$AtlasSetup"
    export HACKFOROLD_AtlasSetupSite="$AtlasSetupSite"
    lsetup git
  fi
else
    alias mounthiggs="sshfs -o allow_other,defer_permissions nico@higgs.hep.manchester.ac.uk: mount/"
    alias mountlxplus="sshfs -o allow_other,defer_permissions nscharmb@lxplus.cern.ch: mount/"
    alias mounteve="sshfs -o allow_other,defer_permissions nscharmb@eve.e5.physik.tu-dortmund.de: mount/"
    # alias vim="~/./nvim-osx64/bin/nvim"
    alias ls="ls -G"
    LSCOLORS+="ex" # directory
    LSCOLORS+="Gx" # symlink
    LSCOLORS+="Bx" # socket
    LSCOLORS+="Dx" # pipe
    LSCOLORS+="bx" # executable
    LSCOLORS+="Eg" # block special
    LSCOLORS+="Ed" # character special
    LSCOLORS+="xb" # executable with setuid bit set
    LSCOLORS+="xg" # executable with setgid bit set
    LSCOLORS+="xc" # directory writable to others, with sticky bit
    LSCOLORS+="xd" # directory writable to others, without sticky bit
    export LSCOLORS
    # a  black
    # b  red
    # c  green
    # d  brown
    # e  blue
    # f  magenta
    # g  cyan
    # h  light grey
    # A  bold black, usually shows up as dark grey
    # B  bold red
    # C  bold green
    # D  bold brown, usually shows up as yellow
    # E  bold blue
    # F  bold magenta
    # G  bold cyan
    # H  bold light grey; looks like bright white
    # x  default foreground or background
    LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:*.aux=01;30:*.fls=01;30:*.out=01;30:*.fdb_latexmk=01;30:'
      export LS_COLORS

fi

#   I moved this stuff to prezto
# zle -N zle-keymap-select
# function zle-keymap-select zle-line-init
# {
#     # change cursor shape in iTerm2
#     if [[ -z $TMUX ]]; then
#         case $KEYMAP in
#             vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
#             viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
#         esac
#     else
#         case $KEYMAP in
#             # printf "\033Ptmux;\033\033[2 q\033\\"
#             vicmd)      print -n -- "\EPtmux;\E\E]50;CursorShape=0\x7\E\\";;  # block cursor
#             viins|main) print -n -- "\EPtmux;\E\E]50;CursorShape=1\x7\E\\";;  # line cursor
#         esac
#     fi

#     zle reset-prompt
#     zle -R
# }

# function zle-line-finish
# {
#     print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
# }

# zle -N zle-line-init
# zle -N zle-line-finish
# # zle -N zle-keymap-select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' accept-exact-dirs true
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|log|pdf|bbl|blg|out|toc):source-files' '*:all-files'
zstyle ':completion:*:*:nvim:*' file-patterns '^*.(aux|log|pdf|bbl|blg|out|toc):source-files' '*:all-files'
# zle -N zle-line-init

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
set -o vi
source "${ZDOTDIR:-$SECONDHOME}/.zprezto/init.zsh"
eval "$(fasd --init auto)"
unalias rm
# Case-insensitive (all), partial-word, and then substring completion.
if zstyle -t ':prezto:module:completion:*' case-sensitive; then
  zstyle ':completion:*' matcher-list '' 'r:|[._-]=*'
  # zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  setopt CASE_GLOB
else
  zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=*'
  # zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unsetopt CASE_GLOB
fi
#Otherwise zsh suggest all users which is super annoying
zstyle ':completion:*' users
unsetopt CORRECT 
setopt clobber
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf + fd, rg, ag configuration
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
if _has fzf && _has fd; then
  export FZF_DEFAULT_COMMAND='fd --type f --color=never'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d . --color=never'
elif _has fzf && _has rg; then
  export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --glob '!.git/*'"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
elif _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --hidden --nocolor -f -g ""'
  # Ag doesnt find hidden files at the moment (maybe)
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi

bindkey -a '^[[3~' delete-char
bindkey '^[[3~' delete-char
# bindkey -M vicmd 'v' edit-command-line
bindkey -M vicmd '^V' edit-command-line
bindkey -M vicmd 'v' vi-cmd-mode
bindkey jk vi-cmd-mode
alias ll="ls -lahtr"
# fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
unalias z

z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf --height 20% -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}
