function remote_info() {
	if [ -n "$SSH_CONNECTION" ]; then
		echo "`echo $SSH_CONNECTION | awk '{ print $3 }'` "
	fi
}
