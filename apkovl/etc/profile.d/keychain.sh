keychain \
  --absolute \
  --dir "${XDG_STATE_HOME}/keychain" \
  --agents ssh \
  --inherit any-once \
  --stop others
. "${XDG_STATE_HOME}/keychain/${HOSTNAME}-sh"
