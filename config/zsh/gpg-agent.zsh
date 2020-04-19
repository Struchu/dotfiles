unset SSH_AGENT_PID

if [ -z "$SSH_TTY" ]; then
    GPG_AGENT_SOCK=$(gpgconf --list-dirs | grep agent-socket | cut -d : -f 2)
    export SSH_AUTH_SOCK="$GPG_AGENT_SOCK.ssh"
fi
