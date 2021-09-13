
_PATH_COLOR='#83a598' # Gruvbox Blue 109-12
_PROMPT_COLOR='#458588' # Gruvbox Blue 66-4
_JOBS_COLOR='#d65d0e' # Gruvbox 166--
_ERROR_COLOR='#cc241d' # Gruvbox 124-1

COLOR=`tput setab 0``tput setaf 2`
FG_RESET="\033[39m"
BG_RESET="\033[49m"
JOBS_PROMPT='%F{'$_JOBS_COLOR'}( %j)'
LAST_PROMPT='%(0?..%F{'$_ERROR_COLOR'}⨯%?)'



echo -ne '\e[6 q' # Beam as cursor

PROMPT='%F{'$_PATH_COLOR'}%m:%~%(!..) %F{'$_PROMPT_COLOR'} '
RPROMPT=$LAST_PROMPT' %(1j.'$JOBS_PROMPT'.) %F{'$_PATH_COLOR'}%T'

#PROMPT='%F{#839496}%m:%~%(!..) %F{#AEC6CF} '
#RPROMPT=$LAST_PROMPT' %(1j.'$JOBS_PROMPT'.) %F{#AEC6CF}%T'
