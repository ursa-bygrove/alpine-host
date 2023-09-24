# Checkout XDG config directory from a repo defined by XDG_CONFIG_REPO
if [ ! -d "${XDG_CONFIG_HOME}/.git" ] && [ -n "${XDG_CONFIG_REPO}" ]; then
  if type -t git > /dev/null; then
    git clone "${XDG_CONFIG_REPO}" "${XDG_CONFIG_HOME}"
  elif type -t docker > /dev/null; then
    docker pull alpine/git
    docker run --rm -v "${XDG_CONFIG_HOME%/*}":/git alpine/git \
      clone "${XDG_CONFIG_REPO}" "${XDG_CONFIG_HOME##*/}"
  fi
fi

# Source .profile from XDG_CONFIG_HOME
if [ -f "${XDG_CONFIG_HOME}/.profile" ]; then
  . "${XDG_CONFIG_HOME}/.profile"
fi
