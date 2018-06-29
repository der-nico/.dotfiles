# .bashrc

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
alias Setupk='kinit nscharmb@CERN.CH'
alias setupafs='kinit nscharmb@CERN.CH; aklog -cell cern.ch'
export PATH=/afs/cern.ch/sw/XML/texlive/2016/bin/x86_64-linux:$PATH
export PATH="$HOME/neovim/bin:$PATH"
# added by Anaconda3 4.3.0 installer
#export PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/bin:$PATH"
# alias vim="vimx"
alias vim="nvim"
alias ll="ls -lahtr"
alias vimpy="vimx --cmd 'let include_pymode=1'"
alias ktmux="k5reauth -f -i 3600 -p nscharmb -k ~/private/tools/nscharmb.keytab -- tmux"
alias reauth="k5reauth -f -x -k ~/private/tools/nscharmb.keytab"

scpo() {
    save_path="macbook:tmp/"
    # if [[ $# -eq 2 ]];
    # then
    #     save_path="$2"
    # fi
    file_names=()
    for file in "$@"
    do
        scp "$file" "$save_path"
        IFS='/' read -a my2array <<< "$file"
        file_names+=("${my2array[@]:(-1)}")
    done

    IFS=':' read -a myarray <<< "$save_path"
    echo ${file_names[@]}
    # ssh macbook "/usr/local/bin/duti -s com.apple.preview .pdf all; cd" "${myarray[1]%$1}" '; open -g' "${file_names[@]}" '; /usr/local/bin/duti -s com.adobe.Reader .pdf all'
    ssh macbook "cd ${myarray[1]%$1}; open -g ${file_names[@]};"
}

export EDITOR=vimx

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ ${HOST:0:6} = "lxplus" ] || [ ${HOST:0:4} = "pc20" ]; then
    alias setupafs='kinit nscharmb@CERN.CH; aklog -cell cern.ch'
    export PATH=/afs/cern.ch/sw/XML/texlive/2016/bin/x86_64-linux:$PATH
    # export PATH=$HOME/private/installed_software/git/bin/:$PATH
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


    if [ ${HOST:0:6} = "lxplus" ]; then
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
    else
        export PATH="$PATH:$HOME/local/bin"
        export PATH="$PATH:/afs/cern.ch/work/n/nscharmb/anaconda3/bin/"
        export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
        alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'
        # alias ag='/afs/cern.ch/work/n/nscharmb/anaconda3/bin/ag --path-to-ignore ~/.ignore'
    fi
    setupATLAS
    lsetup git
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
    . $(brew --prefix root6)/libexec/thisroot.sh
    test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
fi
