# .bash_profile

# -f tests if file exists, therefore only start zsh if executable is there.
if [ -f "/pc2014-data2/nico/bin/zsh" ]; then
    export SHELL=/pc2014-data2/nico/bin/zsh
    if [ -f ~/.zprofile ]; then
        . ~/.zprofile
    fi
    /pc2014-data2/nico/bin/zsh
    if [ $? -eq 0 ]; then
        exit
    fi
elif [ -f "$HOME/local/bin/zsh" ]; then
    export SHELL=~/local/bin/zsh
    if [ -f ~/.zprofile ]; then
        . ~/.zprofile
    fi
    ~/local/bin/zsh
    if [ $? -eq 0 ]; then
        exit
    fi

elif [ -f "$HOME/bin/zsh-5.4.2" ]; then
    export SHELL=~/bin/zsh-5.4.2
    if [ -f ~/.zprofile ]; then
        . ~/.zprofile
    fi
    ~/bin/zsh-5.4.2
    # Exit from bash immediately when I quit zsh.
    if [ $? -eq 0 ]; then
        exit
    fi
elif [ -f "$HOME/bin/zsh-5.5.1" ]; then
    export SHELL=~/bin/zsh-5.5.1
    if [ -f ~/.zprofile ]; then
        . ~/.zprofile
    fi
    ~/bin/zsh-5.5.1
    # Exit from bash immediately when I quit zsh.
    if [ $? -eq 0 ]; then
        exit
    fi
fi

if [ -z ${HOST+x} ]; then export HOST=$HOSTNAME; fi
export PATH="$HOME/bin:$PATH"
if [ ${HOST:0:6} = "lxplus" ] || [ ${HOST:0:4} = "pc20" ]; then
    # export PATH="$HOME/neovim/bin:$PATH"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/lib"
    export RUCIO_ACCOUNT="nscharmb"
    if [ ${HOST:0:6} = "lxplus" ]; then
        # set TEX directory for lxplus
        export PATH="/afs/cern.ch/sw/XML/texlive/2016/bin/x86_64-linux:$PATH"
        # export PATH=$HOME/private/installed_software/git/bin/:$PATH
        export ConndaPYTHONPATHMAIN="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/ring_tools/bin/python"
        export ConndaPYTHON3PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/neovim3/bin/python"
        export ConndaPYTHON2PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/neovim2/bin/python"
    else
        export PYTHONPATH="$PYTHONPATH:/afs/hep.man.ac.uk/u/nico/private/python-tools/"
        export PATH="$PATH:$HOME/local/bin"
        export ATLAS_LOCAL_ROOT_BASE="/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase"
        export PATH="/pc2014-data2/nico/bin:$PATH"
    fi
else
    export PATH="$HOME/nvim-osx64/bin:$PATH"
    export PATH="$HOME/anaconda3/bin:$PATH"
    export ConndaPYTHONPATHMAIN="$HOME/anaconda3/bin/python"
    export ConndaPYTHON3PATH="$HOME/anaconda3/envs/neovim3/bin/python"
    export ConndaPYTHON2PATH="$HOME/anaconda3/envs/neovim2/bin/python"
    export PATHCOLOR="208"        # local
fi
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


export PATH="$HOME/.cargo/bin:$PATH"
