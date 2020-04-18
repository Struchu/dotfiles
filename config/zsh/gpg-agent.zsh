GPG_AGENT_SOCK=$(gpgconf --list-dirs | grep agent-socket | cut -d : -f 2)
if [ ! -S $GPG_AGENT_SOCK ]; then
  gpg-agent --daemon >/dev/null 2>&1
fi

# Set SSH to use gpg-agent if it is configured to do so
GNUPGCONFIG="${GNUPGHOME:-"$HOME/.gnupg"}/gpg-agent.conf"
if [ -z "$SSH_TTY" ] && [ -r "$GNUPGCONFIG" ] && grep -q enable-ssh-support "$GNUPGCONFIG"; then
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK="$GPG_AGENT_SOCK.ssh"
fi

export GPG_TTY=$(tty)
echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null 2>&1
