setopt PROMPT_SUBST

# Last command result indicator
PROMPT_ARROW_ICON="=>"

PROMPT='%(?:%F{green}:%F{red})${PROMPT_ARROW_ICON}'

# Context indicator
ssh_context() {
    if [[ -n "${SSH_CONNECTION-}${SSH_CLIENT-}${SSH_TTY-}" ]] || (( EUID == 0 )); then
        echo -n " %n@%m"
    else
        echo -n ""
    fi
}

PROMPT+='%F{magenta}%B$(ssh_context)%b%f '

# Directory indicator
shorthand_dirs() {
    local PWD=${PWD//$HOME/'~'}
    local PARENT=${PWD##*/}

    if [[ $PWD == '~' ]]; then
        echo -n '~'
        return
    fi

    if [[ $PWD == '/' ]]; then
        echo -n '/'
        return
    fi

    PARENTS=$(dirname $PWD)
    PWD=$(echo "$PARENTS" | sed -re 's/\/(\.?[^\/])[^\/]*/\/\1/g')
    echo -n "$PWD"

    if [[ $PARENTS != '/' ]]; then
        echo -n '/'
    fi

    echo -n "$PARENT"
}

PROMPT+='%F{blue}%B$(shorthand_dirs)%b%f '

# Git status
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%f%F{red}"
ZSH_THEME_GIT_PROMPT_CLEAN="%f%F{green}"

git_status() {
    local branch=$(git_current_branch)

    if [ -n "$branch" ]; then
        echo -n $(parse_git_dirty)
        echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX"
        echo -n "${branch}"
        echo -n "$ZSH_THEME_GIT_PROMPT_SUFFIX"
        echo -n ' '
    fi
}

PROMPT+='$(git_status)'

PROMPT+='%f%b'
