# Customise PATH and shell utilities
export PATH="${XDG_BIN_HOME}:${PATH}"
export PAGER="$(type -P bat || type -P less)"
export EDITOR="$(type -P nvim || type -P vi)"
umask 022

# Load XDG config files: ~/.config/[SHELL-NAME]/*.sh
_shell="$(basename "$(echo "${0:-sh}" | tr -d '-')")"
config_dir="${XDG_CONFIG_HOME}/${_shell}"
if [ -d "${config_dir}" ]; then
  for rc in "${config_dir}"/*.sh; do
    . ${rc}
  done
  unset rc
fi
unset _shell config_dir
