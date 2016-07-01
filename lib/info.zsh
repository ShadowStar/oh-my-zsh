function remote_info() {
	if [ -n "$SSH_CONNECTION" ]; then
		echo "@`echo $SSH_CONNECTION | awk '{ print $3 }'` "
	fi
}

function user_info() {
	if [[ "$DISABLE_USER_INFO" != "true" || -n "$SSH_CONNECTION" ]]; then
		if [ -n "$SUDO_USER" ]; then
			echo "${SUDO_USER}[S] "
		else
			echo "$USER "
		fi
	fi
}

function last_cmd_info() {
	if [[ $? = 0 ]]; then
		echo ${ZSH_THEME_LAST_CMD_SUCCESS}
	else
		echo ${ZSH_THEME_LAST_CMD_FAILED}
	fi
}

function in_vim_shell() {
	if [[ -n "$VIM" ]]; then
		echo ${ZSH_THEME_IN_VIM_SHELL}
	fi
}
