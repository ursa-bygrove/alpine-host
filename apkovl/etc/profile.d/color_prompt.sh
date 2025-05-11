printc() (
  : "${1:?Missing argument -- color name}"
  : "${2:?Missing argument -- string to print}"

  # https://i.stack.imgur.com/utQ7mm.png
  colors() {
    cat <<-EOS | grep -m 1 "${1}" | awk '{ printf "%s" $2 }'
	black         \e[1;30m
	red           \e[1;31m
	green         \e[1;32m
	yellow        \e[1;33m
	blue          \e[1;34m
	magenta       \e[1;35m
	cyan          \e[1;36m
	lightgrey     \e[1;37m
	darkgrey      \e[1;90m
	lightred      \e[1;91m
	lightgreen    \e[1;92m
	lightyellow   \e[1;93m
	lightblue     \e[1;94m
	lightmagenta  \e[1;95m
	lightcyan     \e[1;96m
	white         \e[1;97m
	EOS
  }

  c="$(echo "${1}" | tr -d '[:space:]_-' | tr '[:upper:]' '[:lower:]')"
  printf "\[$(colors "${c}")\]%s\[\e[0m\]" "${2}";
)

color_prompt() (
  # Set user color in shell prompt
  case "${USER}" in
    root|live|production)
      user="$(printc "red" '\u')"
      ;;
    *)
      if [ "$(initial_process_uid)" -eq "$(id -u "${USER}")" ]; then
	user="$(printc "green" '\u')"
      else
	user="$(printc "yellow" '\u')"
      fi
  esac

  # Set host color in shell prompt
  case "$(hostname -f 2>/dev/null)" in
    localhost)
      host="$(printc "red" '\h')"
      ;;
    *)
      if [ -n "${SSH_CONNECTION}" ]; then
	host="$(printc "yellow" '\h')"
      else
	host="$(printc "green" '\h')"
      fi
  esac

  echo "${user}@${host}:\w \\$ "
)

PS1="$(color_prompt) "
