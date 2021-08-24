# lambda-p zsh theme

if [[ "$USER" == "root" ]]; then USERCOLOR="red"; else USERCOLOR="yellow"; fi

function check_git_prompt_info() {
    if type git &>/dev/null && git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -z $(git_prompt_info 2> /dev/null) ]]; then
            echo "%{$fg[blue]%}detached-head%{$reset_color%}) $(git_prompt_status)
%{$fg[yellow]%} λ "
        else
            echo "$(git_prompt_info 2> /dev/null) $(git_prompt_status)
%{$fg_bold[cyan]%} λ "
        fi
    else
        echo "%{$fg_bold[cyan]%} λ "
    fi
}

function get_right_prompt() {
    if type git &>/dev/null && git rev-parse --git-dir > /dev/null 2>&1; then
        echo -n "$(git_prompt_short_sha)%{$reset_color%}"
    else
        echo -n "%{$reset_color%}"
    fi
}

PROMPT='%F{247}[%D{%H:%M:%S}%b]%f \
%{$fg_bold[$USERCOLOR]%}%n \
%{$fg_no_bold[magenta]%}[%'${LAMBDA_MOD_N_DIR_LEVELS:-3}'~]\
$(check_git_prompt_info)\
%{$reset_color%}'

RPROMPT='$(get_right_prompt)'

ZSH_THEME_GIT_PROMPT_PREFIX=" at %{$fg[blue]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_bold[white]%}^"

ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg_bold[white]%}[%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[white]%}]"

