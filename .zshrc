# Don't paint user@hostname on prompt for user...
DEFAULT_USER='srigi'

# Path to your oh-my-zsh configuration
ZSH="$HOME/.dotfiles/zsh/oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="../../themes/srigi"

# Update interval
export UPDATE_ZSH_DAYS=30

# Disable autosetting terminal title
DISABLE_AUTO_TITLE="true"

# load homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

plugins=(brew composer cp docker docker-compose gitfast iterm2 kube-ps1 yarn z)

# Load OH MY ZSH
source $ZSH/oh-my-zsh.sh
export HISTSIZE=$HISTSIZE  # reapply my HISTSIZE

# Load setopt definitions
[[ -s "$HOME/.dotfiles/zsh/setopt" ]] && source "$HOME/.dotfiles/zsh/setopt"

# Load zstyle definitions
[[ -s "$HOME/.dotfiles/zsh/zstyle" ]] && source "$HOME/.dotfiles/zsh/zstyle"

# Load aliases
[[ -s "$HOME/.dotfiles/zsh/aliases" ]] && source "$HOME/.dotfiles/zsh/aliases"

# Load rbenv
if which rbenv > /dev/null; then
	eval "$(rbenv init -)";
	[[ -s /usr/local/opt/rbenv/completions/rbenv.zsh ]] && source /usr/local/opt/rbenv/completions/rbenv.zsh
fi

# Load lunchy tab-completion
LUNCHY=$(gem which lunchy 2>/dev/null)
[[ -n $LUNCHY ]] && LUNCHY_EXTRAS="$(dirname $LUNCHY)/../extras"
[[ -n $LUNCHY_EXTRAS && -r "$LUNCHY_EXTRAS/lunchy-completion.zsh" ]] && source "$LUNCHY_EXTRAS/lunchy-completion.zsh"

# Highlight section titles in man
if [ -t 1 ]; then           # check if stdout is a terminal
	ncolors=$(tput colors)  # see if it supports colors

	if test -n "$ncolors" && test $ncolors -ge 8; then
		WHITE=$(tput setaf 0)
		MAGENTA=$(tput setaf 9)
		PURPLE=$(tput setaf 141)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)

		export LESS_TERMCAP_md=$ORANGE
	fi
fi
