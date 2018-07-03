# Modified from https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/ys.zsh-theme
# and from https://github.com/zuik/stuff/blob/master/config/zui.zsh-theme

#Virualenv stuff
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" %{$fg[white]%}| py:%{$reset_color%} %{$fg[green]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$reset_color%}"

function virtualenv_prompt_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo "%${BRACKETS}[%${GIT}$name%${BRACKETS}]${RESET} "
    fi
}

local v_env='$(virtualenv_prompt_info)'
# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
#  echo "맥도날드"
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

BRACKETS="{$FX[no-bold]$FG[001]%}"
# VCS
YS_VCS_PROMPT_PREFIX1="%{$FG[100]%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[red]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}✖︎"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}●"

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$YS_VCS_PROMPT_DIRTY"
		else
			echo -n "$YS_VCS_PROMPT_CLEAN"
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}

reset="{$reset_color%}"
AT="{$FX[bold]$FG[001]%}"
NAME="{$FX[no-bold]$FG[195]%}"
COMP="{$FX[no-bold]$FG[195]%}"
DEV="{$FX[no-bold]$FG[153]%}"
GIT="{$FX[no-bold]$FG[160]%}"
TIME="{$FX[no-bold]$FG[195]%}"
DIR="{$FX[no-bold]$FG[208]%}"
BOLT="$BRACKETS"
CMDS="%{$FG[255]%}"

TIME_C=" %${BRACKETS}[%${TIME}%*%${BRACKETS}] "
AT_C="${AT}🔥%${RESET}"
NAME_C="%${BRACKETS}┌[%${NAME}%n%${RESET}"
GIT_C="%${GIT}%{${git_info}%}"
COMP_C="${COMP}%m%${BRACKETS}]${RESET}"
VENV_C="${BRACKETS} $(virtualenv_prompt_info)"
DIR_C="%${BRACKETS}[%${DIR}%~%${RESET}${BRACKETS}]"

# Prompt format: \n # USER at MACHINE in DIRECTORY using virtualenv on git:BRANCH STATE [TIME] \n $
PROMPT="\
${NAME_C}\
${AT_C}\
${COMP_C}\
${TIME_C}\
${v_env}\
${hg_info}\
${DIR_C}\
${git_info} 
%${BRACKETS}└[>>> ${CMDS}"

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${hg_info}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}→ %{$reset_color%}"
fi
