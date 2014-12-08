#!/bin/bash

# define some variables
readonly brightness_file="/sys/class/backlight/intel_backlight/brightness"
readonly brightness_value=$(cat /sys/class/backlight/intel_backlight/brightness)
readonly MAX_VALUE="89"
readonly MIN_VALUE="0"
readonly STEP_VALUE="10"

# print usage
function usage(){
	echo "Usage: ${0} [-|+]"
}

# main case to increase or decrease the brightness of the screen
case ${1} in
	+) 	if [ "${brightness_value}" -gt "${MAX_VALUE}" ] ; then
			exit 0
		else
			echo $((${brightness_value}+${STEP_VALUE})) > ${brightness_file}
		fi
	;;

	-)	if [ ${brightness_value} -eq "${MIN_VALUE}" ] ; then
			exit 0
		else
			echo $((${brightness_value}-${STEP_VALUE})) > ${brightness_file}
		fi
	;;

	*) usage ;;
esac
