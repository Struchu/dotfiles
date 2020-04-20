unset SSH_AGENT_PID

gpgconf --create-socketdir

GPG_AGENT_SOCK=$(gpgconf --list-dirs | grep agent-socket | cut -d : -f 2)
export SSH_AUTH_SOCK="$GPG_AGENT_SOCK.ssh"
