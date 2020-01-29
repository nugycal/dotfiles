# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/bin:$HOME/go/bin:/usr/local/bin:$HOME/.composer/vendor/bin:$PATH:$HOME/.cargo/bin"

# Created by newuser for 5.7.1

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk
#
zplugin load zsh-users/zsh-autosuggestions
zplugin load zdharma/fast-syntax-highlighting

zplugin load supercrabtree/k
zplugin light chriskempson/base16-shell
# zplugin load b4b4r07/enhancd
zplugin load wfxr/forgit
zplugin load agkozak/zsh-z
zplugin load andrewferrier/fzf-z
zplugin light unixorn/tumult.plugin.zsh
zplugin light skx/sysadmin-util
zplugin light zplugin/z-a-man
zplugin light chrissicool/zsh-256color
zplugin light kiurchv/asdf.plugin.zsh
zplugin light ael-code/zsh-colored-man-pages
zplugin light Tarrasch/zsh-command-not-found
zplugin light zpm-zsh/ssh
zplugin light DarrinTisdale/zsh-aliases-exa

zplugin ice wait'1' lucid
zplugin light laggardkernel/zsh-thefuck

zplugin ice as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy

zplugin light mdumitru/fancy-ctrl-z

zplugin ice make'!'
zplugin light sei40kr/zsh-fast-alias-tips

zplugin ice depth=1
zplugin light romkatv/powerlevel10k

# zplugin light nugycal/zsh-term-title

# Autosuggestions config
ZSH_AUTOSUGGEST_USE_ASYNC="on"

# Enhancd Config
ENHANCD_FILTER=fzf
export ENHANCD_FILTER

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


git config --global user.email nugycal@gmail.com
git config --global user.name nugycal
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

alias diff="diff-so-fancy"

alias vi="vi -p"
alias c="clear"

mkcd() {
    mkdir $1
    cd $1
}

alias vi="nvim -p"
alias vim="nvim -p"
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

remoteip() {
    if test $# != 1; then
        echo "Usage: $0 <host>" >&2
        exit 1
    fi
    ping -c 1 $1 | egrep -o '\([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\)' | tr -d '()'
}

query() {
    egrep -i "$@" ~/users.db
}

export EDITOR="nvim"
export NNN_USE_EDITOR=1
export NNN_SSHFS_OPTS="sshfs -o follow_symlinks"
export TERM=xterm-256color
export PATH="/usr/local/opt/ruby/bin:$PATH"

source ~/.aliases

setopt  autocd autopushd
POWERLEVEL9K_TRANSIENT_PROMPT=same-dir
export PATH="/usr/local/opt/bison/bin:/usr/local/lib/ruby/gems/2.6.0/bin/:/Library/Frameworks/Mono.framework/:$PATH"
export LDFLAGS="-L/usr/local/opt/bison/lib"
