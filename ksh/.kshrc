# @(#).kshrc 1.0
# Base Korn Shell environment
# Approach:
#      shell            initializations go in ~/.kshrc
#      user             initializations go in ~/.profile
#      host / all_user  initializations go in /etc/profile
#      hard / software  initializations go in /etc/environment

# DEBUG=y       # uncomment to report
[ "$DEBUG" ] && echo "Entering .kshrc"

set -o allexport

# options for all shells --------------------------------
# LIBPATH must be here because ksh is setuid, and LIBPATH is
# cleared when setuid programs are started, due to security hole.

LIBPATH=.:/usr/lib

# options for interactive shells follow-------------------------

TTY=$(tty|cut -f3-4 -d/)
HISTFILE=$HOME/.sh_hist$(echo ${TTY} | tr -d '/')
PWD=$(pwd)
PS1='
${LOGNAME}@${HOSTNAME} on ${TTY}
[${PWD}] '

[ "$DEBUG" ] && echo "Exiting .kshrc"

set +o allexport
