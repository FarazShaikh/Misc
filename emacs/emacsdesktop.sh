#!/bin/bash
EMACS=emacs
EMACSCLIENT=emacsclient

detectEmacs() {
	if hash emacs25 2>/dev/null; then
		EMACS=emacs25
	else
		EMACS=emacs
	fi
}


detectEmacsClient() {
	if hash emacsclient25 2>/dev/null; then
		EMACSCLIENT=emacsclient25
	elif hash emacsclient.emacs25 2> /dev/null; then
		EMACSCLIENT=emacsclient.emacs25
	else 
		EMACSCLIENT=emacsclient
	fi
}

detectEmacsClient
detectEmacs

echo "Using Emacs: $EMACS"
echo "Using Emacsclient: $EMACSCLIENT"
killall ${EMACS}
${EMACS} -rv --daemon -f exwm-enable
${EMACSCLIENT} -a '' -c
