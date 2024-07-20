
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=/usr/share/oh-my-zsh/
autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

PROMPT="%B%{$fg[magenta]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[magenta]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[yellow]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "

ZSH_THEME="robbyrussell"
prompt default &> /dev/null

plugins=(
  git
  npm
  yarn
  history
  ubuntu
	zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh

 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi


bindkey -s ^f "~/scripts/tmux-sessions\n"

#  aliases
alias python=python3
alias p=python3
alias md_pdf="pandoc --pdf-engine=pdfroff --output" 
alias uni="cd ~/Documents/universidad/"
alias note="~/./myScripts/note"
alias v="nvim"
alias lvim="/home/tejada/.local/bin/lvim"
alias r="ranger"
alias books="ranger ~/Documents/books/"
alias mysql=mariadb
alias sdcu="sudo docker-compose up -d"
alias sdcd="sudo docker-compose down"

alias di='lsd --group-dirs=first'

alias gaa="git add ."
alias gcm=git commit
alias gps="git push"
alias gpl="git pull"
alias gcb= git checkout -b


function openNvim {
  if [ $# -eq 0 ]; then
    nvim ./
  else
    nvim $1
  fi
}

if [ "$TMUX" = "" ]; then tmux new-session -A -s home; fi

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi
####   ARCOLINUX SETTINGS   ####
export PAGER='most'

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

setopt GLOB_DOTS
unsetopt SHARE_HISTORY

[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

export EDITOR='nvim'
export VISUAL='nvim'



[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

setxkbmap -option caps:escape

eval "$(starship init zsh)"
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
#screenfetch

export PATH=$PATH:/home/tejada/.spicetify
