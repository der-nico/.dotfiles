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
