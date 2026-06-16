HISTFILE="$HOME/.cache/zsh/.zsh_history"
HISTSIZE=5000
SAVEHIST=5000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/powerlevel10k_rainbow.omp.json)"

eval "$(zoxide init zsh)"

function preexec() {
	local words=("${(z)1}")
	if [[ ${#words} -eq 1 ]]; then
		printf '\e]0;%s\a' "$words[1]"
	else
		printf '\e]0;%s %s\a' "${words[1,-2]}" "${words[-1]:t}"
	fi
}

source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"
source "$HOME/.config/zsh/plugins/nix-zsh-completions/nix-zsh-completions.plugin.zsh"
fpath=("$HOME/.config/zsh/functions" $fpath)
fpath=("$HOME/.config/zsh/plugins/zsh-completions/src" $fpath)

autoload -Uz compinit
compinit -d "$HOME/.cache/zsh/zcomdump-$ZSH_VERSION"

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[[3~' delete-char

alias ls='lsd'
alias cat='bat'
alias cd='z'
alias vim='nvim'

eval "$(fzf --zsh)"
