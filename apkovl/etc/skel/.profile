# Customise PATH and shell utilities
export PATH="${XDG_BIN_HOME}:${PATH}"
export PAGER="$(type -P bat || type -P less)"
export EDITOR="$(type -P nvim || type -P vi)"
umask 022

# Load XDG config files: ~/.config/[SHELL-NAME]/*.sh
# Load local configuration files
source_config_dir() {
  if [ -d "${1}" ]; then
    for rc in "${1}"/*.sh; do
      if type -t "$(basename "${rc}" '.sh')" > /dev/null; then
        . ${rc}
      fi
    done
    unset rc
  fi
}
_shell="$(basename "$(echo "${0:-sh}" | tr -d '-')")"
source_config_dir "${XDG_CONFIG_HOME}/${_shell}"
unset _shell
