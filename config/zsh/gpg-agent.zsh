export GNUPGHOME="$HOME/.gnupg"

if [ -z "$SSH_TTY" ]; then
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK="$GPG_AGENT_SOCK.ssh"
fi

export GPG_TTY=$(tty)
echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null 2>&1
