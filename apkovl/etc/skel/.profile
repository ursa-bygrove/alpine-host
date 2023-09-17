# Checkout XDG config directory from a repo defined by XDG_CONFIG_REPO
if [ ! -d "${XDG_CONFIG_HOME}/.git" ] && [ -n "${XDG_CONFIG_REPO}" ]; then
  git clone "${XDG_CONFIG_REPO}" "${XDG_CONFIG_HOME}"
fi

# Source .profile from XDG_CONFIG_HOME
if [ -f "${XDG_CONFIG_HOME}/.profile" ]; then
  . "${XDG_CONFIG_HOME}/.profile"
fi
