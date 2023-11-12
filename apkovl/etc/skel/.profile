# Checkout XDG config directory from a repo defined by XDG_CONFIG_REPO
if [ ! -d "${XDG_CONFIG_HOME}/.git" ]; then
  if [ -z "${XDG_CONFIG_REPO}" ]; then
    echo "Where are your XDG_CONFIG_HOME files stored?"
    read -rp "Git URL: " XDG_CONFIG_REPO
  fi
  if [ -n "${XDG_CONFIG_REPO}" ]; then
    if type -t git > /dev/null; then
      git clone "${XDG_CONFIG_REPO}" "${XDG_CONFIG_HOME}"
    else
      echo "Command not found -- git" >&2
    fi
    find "${XDG_CONFIG_HOME}" \
      -name '.??*' ! -name '.git' \
      -mindepth 1 -maxdepth 1 \
      -exec ln -sv {} \;
  fi
fi

# Source .profile from XDG_CONFIG_HOME
if [ -f "${XDG_CONFIG_HOME}/.profile" ]; then
  . "${XDG_CONFIG_HOME}/.profile"
fi

# Clean up old history files
rm -f ~/.*sh_history
