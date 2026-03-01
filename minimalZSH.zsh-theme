PROMPT="%(?:%{$fg_bold[white]%}%1{>%} :%{$fg_bold[white]%}%1{>%} ) %{$fg[white]%}%c%{$reset_color%} "
RPROMPT='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg_bold[blue]%}%{$FG[250]%}"

ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" ±"
ZSH_THEME_GIT_PROMPT_CLEAN=""
