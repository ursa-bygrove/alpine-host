ssh-agent-reuse() {
    SSH_AUTH_SOCK="$(find /tmp/ssh-* -user ${USER} -maxdepth 1 -type s -name 'agent.*' -exec ls -1t {} + | head -1)"
}

[ -n "${SSH_AUTH_SOCK}" ] || ssh-agent-reuse
