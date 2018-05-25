# .bash_profile

# -f tests if file exists, therefore only start zsh if executable is there.
if [ -f "$HOME/bin/zsh-5.4.2" ]; then
    export SHELL=~/bin/zsh-5.4.2
    ~/bin/zsh-5.4.2
    # Exit from bash immediately when I quit zsh.
    if [ $? -eq 0 ]; then
        exit
    fi
fi
if [ -f "$HOME/bin/zsh-5.2" ]; then
    export SHELL=~/bin/zsh-5.2
    ~/bin/zsh-5.2
    # Exit from bash immediately when I quit zsh.
    if [ $? -eq 0 ]; then
        exit
    fi
fi

. $(brew --prefix root6)/libexec/thisroot.sh
alias mountihiggs="sshfs -o allow_other,defer_permissions nico@higgs.hep.manchester.ac.uk: mount/"
alias mountilxplus="sshfs  -o allow_other,defer_permissions nscharmb@lxplus.cern.ch: mount/"
# added by Anaconda3 4.2.0 installer
export PATH="/Users/nicolas/anaconda3/bin:$PATH"
export ConndaPYTHON3PATH="/Users/nicolas/anaconda3/bin"
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
# export PYTHONPATH=/afs/cern.ch/project/xrootd/software/python/0.3.0/x86_64-slc6/lib/python2.7/site-packages:$PYTHONPATH

PATH=$PATH:$HOME/bin

export PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
