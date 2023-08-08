mkdir -p \
  "${XDG_BIN_HOME:=$HOME/.local/bin}" \
  "${XDG_CACHE_HOME:=$HOME/.cache}" \
  "${XDG_CONFIG_HOME:=$HOME/.config}" \
  "${XDG_DATA_HOME:=$HOME/.local/share}" \
  "${XDG_RUNTIME_DIR:=$HOME/.local/run}" \
  "${XDG_STATE_HOME:=$HOME/.local/state}"

chown "${USER}:$(id -gn "${USER}")" "${XDG_RUNTIME_DIR}"
chmod 0700 "${XDG_RUNTIME_DIR}"

export \
  XDG_BIN_HOME \
  XDG_CACHE_HOME \
  XDG_CONFIG_HOME \
  XDG_DATA_HOME \
  XDG_RUNTIME_DIR \
  XDG_STATE_HOME
