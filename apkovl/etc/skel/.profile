# Customise PATH and other shell variables
export PATH="${XDG_BIN_HOME}:${PATH}"
export PAGER="$(type -P bat || type -P less)"
export EDITOR="$(type -P nvim || type -P vi)"

# Checkout XDG config directory from a repo defined by XDG_CONFIG_REPO
if [ ! -d "${XDG_CONFIG_HOME}/.git" ] && [ -n "${XDG_CONFIG_REPO}" ]; then
  git clone "${XDG_CONFIG_REPO}" "${XDG_CONFIG_HOME}"
fi

# Load shell config files from ~/.config/[SHELL-NAME]/**/*.sh
find -L \
  "${XDG_CONFIG_HOME}/$(basename "$(echo "${0:-sh}" | tr -d '-')")" \
  -type f -iname '*.sh' -exec . ${rc} \;
