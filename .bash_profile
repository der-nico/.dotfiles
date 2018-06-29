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

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

