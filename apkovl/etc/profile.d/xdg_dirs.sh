_shell="$(basename "$(echo "${0:-sh}" | tr -d '-')")"
_confdir=${XDG_CONFIG_HOME:-$HOME/.config}/${_shell}
_datadir=${XDG_DATA_HOME:-$HOME/.local/share}/${_shell}

mkdir -p "${_datadir}"
HISTFILE="${_datadir}/history"

if [ -d "${_confdir}" ]; then
    for rc in $(find "${_confdir}" -name *.sh); do
        . ${rc}
    done
fi

unset _datadir
unset _confdir
unset _shell
