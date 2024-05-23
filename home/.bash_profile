#
# ~/.bash_profile
#

PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH; export PATH 
MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH; export MANPATH 
INFOPATH=/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH; export INFOPATH

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi

eval `opam config env` 
. "$HOME/.cargo/env"

