
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export FZF_CTRL_T_OPTS="\
--preview '
if [ -d {} ]; then
  ls -la {};
else
  bat --style=numbers --color=always --line-range :300 {} || file --brief {};
fi' \
--preview-window=right:60%"

[ -f ~/.custom.zsh ] && source ~/.custom.zsh


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

ff() {
  aerospace list-windows --all | fzf --bind 'enter:execute(zsh -c "aerospace focus --window-id {1}")+abort'
}

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

. "$(brew --prefix asdf)/libexec/asdf.sh"

export PATH="$PATH:$(go env GOBIN)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(zoxide init zsh)"
