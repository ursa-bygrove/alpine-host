# Checkout XDG config directory from a repo defined by XDG_CONFIG_REPO
if [ ! -d "${XDG_CONFIG_HOME}/.git" ]; then
  if [ -z "${XDG_CONFIG_REPO}" ]; then
    echo "Where are your XDG_CONFIG_HOME files stored?"
    read -rp "Git URL: " XDG_CONFIG_REPO
  fi
  if [ -n "${XDG_CONFIG_REPO}" ]; then
    if type -t git > /dev/null; then
      git clone "${XDG_CONFIG_REPO}" "${XDG_CONFIG_HOME}"
    elif type -t docker > /dev/null; then
      docker pull alpine/git
      docker run --rm \
        -e SSH_AUTH_SOCK=/root/.ssh/auth_sock \
        -v "${HOME}":/root \
        -v /tmp:/tmp \
        -v "${XDG_CONFIG_HOME%/*}":/git alpine/git \
        clone "${XDG_CONFIG_REPO}" "${XDG_CONFIG_HOME##*/}"
    fi
  fi
fi

# Source .profile from XDG_CONFIG_HOME
if [ -f "${XDG_CONFIG_HOME}/.profile" ]; then
  . "${XDG_CONFIG_HOME}/.profile"
fi

# Clean up old history files
rm -f ~/.*sh_history
