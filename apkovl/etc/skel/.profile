# Customise PATH and shell utilities
export PATH="${XDG_BIN_HOME}:${PATH}"
export PAGER="$(type -P bat || type -P less)"
export EDITOR="$(type -P nvim || type -P vi)"
umask 022

# Load XDG config files: ~/.config/[SHELL-NAME]/*.sh
_shell="$(basename "$(echo "${0:-sh}" | tr -d '-')")"
source_configs_for_available_tools() {
  if [ -d "${1}" ]; then
    for rc in "${1}"/*.sh; do
      if type -t "$(basename "${rc}" '.sh')" > /dev/null; then
        . ${rc}
      fi
    done
    unset rc
  else
    echo "WARNING: Missing directory -- ${1}" >&2
  fi
}
source_configs_for_available_tools "${XDG_CONFIG_HOME}/${_shell}"
unset _shell source_configs_for_available_tools
