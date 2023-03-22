# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH/usr/sbin:/usr/local/sbin:/usr/local/go/bin:/home/blank/go/bin:/home/blank/.local/bin"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 1	# update everyday
ENABLE_CORRECTION="true"
HIST_STAMPS="dd/mm/yyyy"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='codium'
fi

alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'
alias l='ls -alh'

export PATH="$HOME/.poetry/bin:$PATH"

PATH="/home/blank/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/blank/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/blank/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/blank/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/blank/perl5"; export PERL_MM_OPT;

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec sway

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# pkg-config
export PKG_CONFIG_PATH="$PATH"

# aliases
source ~/.aliases

# zinit install
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# zsh-fzf-history-search
zinit ice lucid wait'0'
zinit light-mode for \
    joshskidmore/zsh-fzf-history-search \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-completions

# Start starship
eval "$(starship init zsh)"
