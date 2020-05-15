unset SSH_AGENT_PID

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket | cut -d : -f 2)
