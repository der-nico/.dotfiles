# .zprofile


# PATHCOLOR="26"        # lxplus
# PATHCOLOR="208"       # local
# PATHCOLOR="135"        # manchester
if [ -z ${HOST+x} ]; then export HOST=$HOSTNAME; fi
export PATH="$HOME/bin:$PATH"
if [ ${HOST:0:6} = "lxplus" ] || [ ${HOST:0:4} = "pc20" ]; then
    # export PATH="$HOME/neovim/bin:$PATH"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/lib"
    export RUCIO_ACCOUNT="nscharmb"
    if [ ${HOST:0:6} = "lxplus" ]; then
        export SECONDHOME=$HOME
        # set TEX directory for lxplus
        export PATH="/afs/cern.ch/sw/XML/texlive/2016/bin/x86_64-linux:$PATH"
        # export PATH=$HOME/private/installed_software/git/bin/:$PATH
        export ConndaPYTHONPATHMAIN="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/ring_tools/bin/python"
        export ConndaPYTHON3PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/neovim3/bin/python"
        export ConndaPYTHON2PATH="/afs/cern.ch/work/n/nscharmb/anaconda3/envs/neovim2/bin/python"
        export PATHCOLOR="26"        # lxplus
    else
        export SECONDHOME="/pc2014-data2/nico"
        export PYTHONPATH="$PYTHONPATH:/afs/hep.man.ac.uk/u/nico/private/python-tools/"
        export PATH="$PATH:$HOME/local/bin"
        export PATH="$PATH:$SECONDHOME/neovim/bin"
        export PATH="/pc2014-data2/nico//bin:$PATH"
        export ATLAS_LOCAL_ROOT_BASE="/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase"
        export PATHCOLOR="135"        # manchester
    fi
else
    export SECONDHOME=$HOME
    export PATH="$HOME/anaconda3/bin:$PATH"
    export ConndaPYTHONPATHMAIN="$HOME/anaconda3/bin/python"
    export ConndaPYTHON3PATH="$HOME/anaconda3/envs/neovim3/bin/python"
    export ConndaPYTHON2PATH="$HOME/anaconda3/envs/neovim2/bin/python"
    export PATHCOLOR="208"        # local
fi

export PATH="$HOME/.cargo/bin:$PATH"
