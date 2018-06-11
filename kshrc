
#set -o vi

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
	gpg-connect-agent /bye >/dev/null 2>&1
	gpg-connect-agent updatestartuptty /bye >/dev/null
fi
# use a tty for gpg
# solves error: "gpg: signing failed: Inappropriate ioctl for device"
GPG_TTY=$(tty)
export GPG_TTY
# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	if [[ -z "$SSH_AUTH_SOCK" ]] || [[ "$SSH_AUTH_SOCK" == *"apple.launchd"* ]]; then
		SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
		export SSH_AUTH_SOCK
	fi
fi

# add alias for ssh/git to update the tty
alias ssh="gpg-connect-agent updatestartuptty /bye >/dev/null; ssh"
alias git="gpg-connect-agent updatestartuptty /bye >/dev/null; git"

# Shortcuts
alias dl="cd ~/Downloads"
alias g="git"
alias h="history"

# copy working directory
alias cwd='pwd | tr -d "\r\n" | xclip -selection clipboard'

