install -d -m 2755 \
  "${XDG_BIN_HOME:=$HOME/.local/bin}" \
  "${XDG_CACHE_HOME:=$HOME/.cache}" \
  "${XDG_CONFIG_HOME:=$HOME/.config}" \
  "${XDG_DATA_HOME:=$HOME/.local/share}" \
  "${XDG_STATE_HOME:=$HOME/.local/state}"

install -d -m 2700 \
  "${XDG_RUNTIME_DIR:=$HOME/.local/run}"

export \
  XDG_BIN_HOME \
  XDG_CACHE_HOME \
  XDG_CONFIG_HOME \
  XDG_DATA_HOME \
  XDG_STATE_HOME \
  XDG_RUNTIME_DIR
