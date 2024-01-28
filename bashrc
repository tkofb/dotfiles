#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -e $HOME/.aliases ]; then
    source $HOME/.aliases
fi

PS1='[\[\e[38;5;99;1m\]󰡘\[\e[0m\]][\[\e[38;5;195;1m\]\u\[\e[0m\]][\[\e[38;5;221;1m\]\w\[\e[0m\]]\[\e[38;5;165m\] \[\e[0m\] '

# git repository greeter
last_repository=
check_directory_for_new_repository() {
	current_repository=$(git rev-parse --show-toplevel 2> /dev/null)
	
	if [ "$current_repository" ] && \
	   [ "$current_repository" != "$last_repository" ]; then
		onefetch
	fi
	last_repository=$current_repository
}
cd() {
	builtin cd "$@"
	check_directory_for_new_repository
}

export PATH="/home/jani/.cargo/bin:/home/jani/.opam/4.14.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
