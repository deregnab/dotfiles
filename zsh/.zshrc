# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent identities id_ed25519 
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent lazy yes
# you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#export ZSH="/home/deregnab/.oh-my-zsh"
#ZSH_THEME="ys"
  # Set name of the theme to load --- if set to "random", it will
  # load a random theme each time oh-my-zsh is loaded, in which case,
  # to know which specific one was loaded, run: echo $RANDOM_THEME
  # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

  # Set list of themes to pick from when loading at random
  # Setting this variable when ZSH_THEME=random will cause zsh to load
  # a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
  # If set to an empty array, this variable will have no effect.
  # ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

  # Uncomment the following line to use case-sensitive completion.
  # CASE_SENSITIVE="true"

  # Uncomment the following line to use hyphen-insensitive completion.
  # Case-sensitive completion must be off. _ and - will be interchangeable.
  # HYPHEN_INSENSITIVE="true"

  # Uncomment the following line to disable bi-weekly auto-update checks.
  # DISABLE_AUTO_UPDATE="true"

  # Uncomment the following line to automatically update without prompting.
  # DISABLE_UPDATE_PROMPT="true"

  # Uncomment the following line to change how often to auto-update (in days).
  # export UPDATE_ZSH_DAYS=13

  # Uncomment the following line if pasting URLs and other text is messed up.
  # DISABLE_MAGIC_FUNCTIONS=true

  # Uncomment the following line to disable colors in ls.
  # DISABLE_LS_COLORS="true"

  # Uncomment the following line to disable auto-setting terminal title.
  # DISABLE_AUTO_TITLE="true"

  # Uncomment the following line to enable command auto-correction.
  # ENABLE_CORRECTION="true"

  # Uncomment the following line to display red dots whilst waiting for completion.
  # COMPLETION_WAITING_DOTS="true"

  # Uncomment the following line if you want to disable marking untracked files
  # under VCS as dirty. This makes repository status check for large repositories
  # much, much faster.
  # DISABLE_UNTRACKED_FILES_DIRTY="true"

  # Uncomment the following line if you want to change the command execution time
  # stamp shown in the history command output.
  # You can set one of the optional three formats:
  # "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
  # or set a custom format using the strftime function format specifications,
  # see 'man strftime' for details.
  # HIST_STAMPS="mm/dd/yyyy"

  # Would you like to use another custom folder than $ZSH/custom?
  # ZSH_CUSTOM=/path/to/new-custom-folder

  # Which plugins would you like to load?
  # Standard plugins can be found in ~/.oh-my-zsh/plugins/*
  # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
  # Example format: plugins=(rails git textmate ruby lighthouse)
  # Add wisely, as too many plugins slow down shell startup.
#  man() {
#	env LESS_TERMCAP_mb=$'\E[01;31m'   \
#	  LESS_TERMCAP_md=$'\E[01;38;5;74m'  \
#	  LESS_TERMCAP_me=$'\E[0m'           \
#	  LESS_TERMCAP_se=$'\E[0m'           \
#	  LESS_TERMCAP_so=$'\E[38;5;246m'    \
#	  LESS_TERMCAP_ue=$'\E[0m'           \
#	  LESS_TERMCAP_us=$'\E[04;38;5;146m' \
#	  man "$@"
#	}

  export GPG_TTY=$(tty)
 # source $ZSH/oh-my-zsh.sh

  # User configuration

  # export MANPATH="/usr/local/man:$MANPATH"

  # You may need to manually set your language environment
  # export LANG=en_US.UTF-8

  # Preferred editor for local and remote sessions
  # if [[ -n $SSH_CONNECTION ]]; then
  #   export EDITOR='vim'
  # else
  #   export EDITOR='mvim'
  # fi

  # Compilation flags
  # export ARCHFLAGS="-arch x86_64"

  # Set personal aliases, overriding those provided by oh-my-zsh libs,
  # plugins, and themes. Aliases can be placed here, though oh-my-zsh
  # users are encouraged to define aliases within the ZSH_CUSTOM folder.
  # For a full list of active aliases, run `alias`.
  #
  # Example aliases
  # alias zshconfig="mate ~/.zshrc"
  # alias ohmyzsh="mate ~/.oh-my-zsh"

# Vault configuration
 function vault_login(){
   echo "Which vault namespace?"
   read VAULT_NAMESPACE
   local NEW_TOKEN=$(vault login -method=ldap -token-only -namespace="adeo/${VAULT_NAMESPACE}" username="${LMFR_LDAP}")
   echo "VAULT_TOKEN=${NEW_TOKEN}" > ~/.env
   source ~/.env
   export VAULT_TOKEN
   echo "VAULT_TOKEN=${VAULT_TOKEN}"
}
export VAULT_TOKEN


  joseph ()
  {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
  }

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# alias zypper="sudo zypper"
alias -s {yml,yaml}=vim

alias reboot="sudo reboot"
alias poweroff="sudo poweroff"
alias gitk="gitk --all"
alias git-tree="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
# alias rofi="rofi -modi window,drun,run -show drun -sidebar-mode -terminal termite -color-window '#000000, #000000, #000000' -color-normal '#000000, #b3e774, #000000, #b3e774, #000000' -color-active '#000000, #b3e774, #000000, #b3e774, #000000' -color-urgent '#000000, #b3e774, #000000, #b3e774, #000000'"


export LESS="-R"

export DOCKER_BUILDKIT=1

export DIRSTACKSIZE=8
export TERM=xterm-256color
export HISTTIMEFORMAT="%d/%m/%y %T "

export VAULT_ADDR="https://vault.factory.adeo.cloud"
export LMFR_LDAP=10150332


setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'

eval $( dircolors -b $HOME/.dircolors )
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

setopt AUTO_PUSHD                  # pushes the old directory onto the stack
setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')
autoload -U compinit && compinit   # load + start completion
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'
GITSTATUS_LOG_LEVEL=DEBUG
#source /home/deregnab/.config/antigen/antigen.zsh
source /home/deregnab/.tools/subrepo/.rc
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

antidote load
source ~/.zsh_plugins.zsh
autoload -Uz promptinit && promptinit && prompt powerlevel10k 
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/mc mc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
