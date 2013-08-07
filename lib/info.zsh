function remote_info() {
	if [ -n "$SSH_CONNECTION" ]; then
		echo "`echo $SSH_CONNECTION | awk '{ print $3 }'` "
	fi
}

function user_info() {
	if [ -n "$SUDO_USER" ]; then
		echo "$SUDO_USER[S] "
	elif [[ "$DISABLE_USER_INFO" != "true" ]]; then
		echo "$USER "
	fi
}
