# Color table: https://i.stack.imgur.com/utQ7mm.png
#   \e[0m    - normal
#   \e[1;31m - red
#   \e[1;32m - green
#   \e[1;33m - yellow

_color_in() { printf '%s%s\e[0m' "${1}" "${2}"; }
_color_red() { _color_in '\e[1;31m' "${1}"; }
_color_green() { _color_in '\e[1;32m' "${1}"; }
_color_yellow() { _color_in '\e[1;33m' "${1}"; }

case "$(hostname -s)" in
  DKs-*)
    _host="$(_color_green '\h')"
    ;;
  *)
    if [ -f /.dockerenv ]; then
      _host="$(_color_yellow '\h')"
    elif [ "${SSH_CLIENT}" ]; then
      _host="$(_color_red '\h')"
    fi
esac

if [ "${USER}" = "root" ]; then
  _symbol='⌗'
else
  _symbol='❭'
fi

case "${USER}" in
  root|production)
    _user="$(_color_red "${SSH_CLIENT:+\u}${_symbol}")"
    ;;
  dk|app)
    _user="$(_color_green "${SSH_CLIENT:+\u}${_symbol}")"
    ;;
  *)
    _user="$(_color_yellow "\u${_symbol}")"
    ;;
esac

PS1="${_host}:\w ${_user} "

unset -f _color_in _color_red _color_green _color_yellow
unset _host _symbol _user
