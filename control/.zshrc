# Include bash profile by default
emulate sh -c 'source /etc/profile'

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt inc_append_history
setopt extended_history
bindkey -e

setopt auto_cd                  # if command is a path, cd into it
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'
setopt correct                  # try to correct spelling of commands

# Better autocompletion
autoload -Uz compinit
compinit
setopt hash_list_all
setopt completealiases
setopt complete_in_word
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' '+l:|=* r:|=*' # ignore case and complete in middle of word

bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[3~"   delete-char
bindkey  "^[[4~"   end-of-line

autoload -U colors
colors 

export PS1="${fg[yellow]}%n${fg[red]}@%m ${fg[blue]}[%~]${reset_color} "

# Link ssh agent socket
test -S $SSH_AUTH_SOCK && ( echo "$SSH_AUTH_SOCK" | grep -Eq '/tmp/ssh-[a-zA-Z0-9]+/agent.[0-9]+' ) && ln -sf "$SSH_AUTH_SOCK" "/tmp/ssh-agent-$USER-screen"

