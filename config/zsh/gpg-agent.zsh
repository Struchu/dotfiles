unset SSH_AGENT_PID

[ -n "$SSH_TTY" ] && gpgconf --create-socketdir

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket | cut -d : -f 2)
