#!/usr/bin/env zsh

# ------------------------------------------------------------------------------

# Print a grid of all the possible shell colors
# https://unix.stackexchange.com/a/285956
function terminal_colorgrid(){
  iter=16
  while [ $iter -lt 52 ]
  do
    second=$[$iter+36]
    third=$[$second+36]
    four=$[$third+36]
    five=$[$four+36]
    six=$[$five+36]
    seven=$[$six+36]
    if [ $seven -gt 250 ];then seven=$[$seven-251]; fi

    echo -en "\033[38;5;$(echo $iter)m█ "
    printf "%03d" $iter
    echo -en "   \033[38;5;$(echo $second)m█ "
    printf "%03d" $second
    echo -en "   \033[38;5;$(echo $third)m█ "
    printf "%03d" $third
    echo -en "   \033[38;5;$(echo $four)m█ "
    printf "%03d" $four
    echo -en "   \033[38;5;$(echo $five)m█ "
    printf "%03d" $five
    echo -en "   \033[38;5;$(echo $six)m█ "
    printf "%03d" $six
    echo -en "   \033[38;5;$(echo $seven)m█ "
    printf "%03d" $seven

    iter=$[$iter+1]
    printf '\r\n'
  done
}

# ------------------------------------------------------------------------------

function enable_color_display() {
  # Bright white
  DISPLAY_BRIGHT="\033[1;37m"
  export DISPLAY_BRIGHT
  # Green
  DISPLAY_HIGHLIGHT="\033[1;32m"
  export DISPLAY_HIGHLIGHT
  # Yellow
  DISPLAY_WARNING="\033[1;33m"
  export DISPLAY_WARNING
  # Red
  DISPLAY_ERROR="\033[1;31m"
  export DISPLAY_ERROR
  # Blue
  DISPLAY_URL="\033[1;94m"
  export DISPLAY_URL
  # Set back to normal
  DISPLAY_NC="\033[0m"
  export DISPLAY_NC
  # printf "${DISPLAY_BRIGHT} - DISPLAY_BRIGHT - ${DISPLAY_NC}"
  # printf "${DISPLAY_HIGHLIGHT} - DISPLAY_HIGHLIGHT - ${DISPLAY_NC}"
  # printf "${DISPLAY_WARNING} - DISPLAY_WARNING - ${DISPLAY_NC}"
  # printf "${DISPLAY_ERROR} - DISPLAY_ERROR - ${DISPLAY_NC}"
  # printf "${DISPLAY_URL} - DISPLAY_URL - ${DISPLAY_NC}"

  # LAB - Aqua
  DISPLAY_I="\033[01;38;5;121m"; export DISPLAY_II
  # DEV - Lime Green
  DISPLAY_II="\033[01;38;5;076m"; export DISPLAY_II
  # QAT - Cyan
  DISPLAY_III="\033[01;38;5;045m"; export DISPLAY_III
  # INT - Magenta
  DISPLAY_IV="\033[01;38;5;201m"; export DISPLAY_IV
  # STG - Orange
  DISPLAY_V="\033[01;38;5;208m"; export DISPLAY_V
  # LOD - Deep Pink
  DISPLAY_VI="\033[01;38;5;124m"; export DISPLAY_V
  # SAL - Purple
  DISPLAY_VII="\033[01;38;5;093m"; export DISPLAY_VIII
  # PRD - Red
  DISPLAY_VIII="\033[01;38;5;196m"; export DISPLAY_VIII
}
enable_color_display

# ------------------------------------------------------------------------------

function terminal_print_color_display_samples() {
  printf "${DISPLAY_BRIGHT} * DISPLAY_BRIGHT - White${DISPLAY_NC}\n"
  printf "${DISPLAY_HIGHLIGHT} * DISPLAY_HIGHLIGHT - Green${DISPLAY_NC}\n"
  printf "${DISPLAY_WARNING} * DISPLAY_WARNING - Yellow${DISPLAY_NC}\n"
  printf "${DISPLAY_ERROR} * DISPLAY_ERROR - Red${DISPLAY_NC}\n"
  printf "${DISPLAY_URL} * DISPLAY_URL - Blue${DISPLAY_NC}\n"
  printf "  -------------------------\n"
  printf "${DISPLAY_I} * DISPLAY_I - Aqua${DISPLAY_NC}\n"
  printf "${DISPLAY_II} * DISPLAY_II - Lime Green${DISPLAY_NC}\n"
  printf "${DISPLAY_III} * DISPLAY_III - Cyan${DISPLAY_NC}\n"
  printf "${DISPLAY_IV} * DISPLAY_IV - Magenta${DISPLAY_NC}\n"
  printf "${DISPLAY_V} * DISPLAY_V - Orange${DISPLAY_NC}\n"
  printf "${DISPLAY_VI} * DISPLAY_VI - Deep Pink${DISPLAY_NC}\n"
  printf "${DISPLAY_VII} * DISPLAY_VII - Purple${DISPLAY_NC}\n"
  printf "${DISPLAY_VIII} * DISPLAY_VIII - Red${DISPLAY_NC}\n"
  printf "  -------------------------\n"
}

# ------------------------------------------------------------------------------

# Set Terminal title - Requires `DISABLE_AUTO_TITLE="true"` set in `~/.zshrc`
function terminal_set_title(){
  if [ "${DISABLE_AUTO_TITLE}" = "true" ]; then
    # TITLE="\[\e]2;$*\a\]"
    # echo -e ${TITLE}
    KERNEL=$(uname)
    if [[ "${KERNEL}" == "Darwin" ]]; then
      echo -ne "\033]0;"$*"\007"
    else
      echo -en "\e]2;$@\a"
    fi
  else
    printf "${DISPLAY_ERROR} * DISABLE_AUTO_TITLE is not set to false, cannot set terminal title.${DISPLAY_NC}\n"
  fi
}

# ------------------------------------------------------------------------------

function terminal_set_color {
  TERM_TYPE_NAME=$(ps -p $(ps -p $$ -o ppid=) -o args=)
  if [[ "${TERM_TYPE_NAME}" == *"iTerm2"* ]]; then
    case $1 in
    green)
    echo -e "\033]6;1;bg;red;brightness;57\a"
    echo -e "\033]6;1;bg;green;brightness;197\a"
    echo -e "\033]6;1;bg;blue;brightness;77\a"
    ;;
    red)
    echo -e "\033]6;1;bg;red;brightness;270\a"
    echo -e "\033]6;1;bg;green;brightness;60\a"
    echo -e "\033]6;1;bg;blue;brightness;83\a"
    ;;
    orange)
    echo -e "\033]6;1;bg;red;brightness;227\a"
    echo -e "\033]6;1;bg;green;brightness;143\a"
    echo -e "\033]6;1;bg;blue;brightness;10\a"
    ;;
    esac
  fi
 }

# ------------------------------------------------------------------------------

# Prints a separator line to screen
function print_divider() {
  printf "\n#-------------------------------------------------------------------------------\n\n"
}

# ------------------------------------------------------------------------------
