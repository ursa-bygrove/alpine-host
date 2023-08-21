if type -P keychain > /dev/null; then
  keychain \
    --absolute \
    --dir "${XDG_STATE_HOME}/keychain" \
    --agents ssh \
    --inherit any-once \
    --stop others
fi

if [ -f "${XDG_STATE_HOME}/keychain/${HOSTNAME}-sh" ]; then
  . "${XDG_STATE_HOME}/keychain/${HOSTNAME}-sh"
fi
