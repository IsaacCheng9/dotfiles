# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Node Version Manager (NVM) config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export GPG_TTY=$(tty)

# Homebrew configuration
if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Cursor CLI setup
export PATH="$HOME/.local/bin:$PATH"
# Rust configuration
. "$HOME/.cargo/env"

# pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# git bare repository configuration
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Enable colours
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# zsh-autosuggestions for fish-like auto-suggestions
if [[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Add syntax highlighting
if [[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# fzf-tab for tab completion
autoload -U compinit; compinit
source /Users/isaac/Dropbox/Documents/Apps/fzf-tab/fzf-tab.plugin.zsh

# Powerlevel10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# Turn on P10k instant prompt with quiet mode
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Pure theme
# autoload -U promptinit; promptinit
# prompt pure

# Starship theme
# eval "$(starship init zsh)"

# Oh My Posh theme
# eval "$(oh-my-posh init zsh)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/star.omp.json)"

# Add autocompletion for ty CLI
eval "$(ty generate-shell-completion zsh)"
