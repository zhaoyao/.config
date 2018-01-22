bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/zhaoyao/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source "$(brew --prefix zplug)/init.zsh"

zplug "zsh-users/zsh-history-substring-search"

zplug "tcnksm/docker-alias", use:zshrc

zplug "plugins/git",   from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"

zplug "zsh-users/zsh-completions"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "~/.zsh", from:local

# zplug 'dracula/zsh', as:theme
#zplug 'oskarkrawczyk/honukai-iterm-zsh', as:theme

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug 'supercrabtree/k'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zhaoyao/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/zhaoyao/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zhaoyao/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/zhaoyao/google-cloud-sdk/completion.zsh.inc'; fi
