#!/bin/bash

# define some variables
readonly BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/brightness"
readonly BRIGHTNESS_VALUE=$(cat ${BRIGHTNESS_FILE})
readonly MAX_VALUE="89"
readonly MIN_VALUE="0"
STEP_VALUE="10"

# print _usage
# print the usage of this script
function usage(){
	echo "Usage: ${0} (-|+)"
	return 0
}

# function _sum
# return the result : $1 + $2
function _sum(){
	echo "$((${1}+${2}))" ; return 0
}

# function _sub
# return the result : $1 - $2
function _sub(){
	echo "$((${1}-${2}))" ; return 0
}

# main case to increase or decrease the brightness of the screen
case ${1} in
	+)	if [ "${BRIGHTNESS_VALUE}" -gt "${MAX_VALUE}" ] ; then
			exit 0
		else
			_sum "${BRIGHTNESS_VALUE}" "${STEP_VALUE}" > ${BRIGHTNESS_FILE}
		fi
	;;

	-)	if [ ${BRIGHTNESS_VALUE} -eq "${MIN_VALUE}" ] ; then
			exit 0
		else
			echo  "${BRIGHTNESS_VALUE}" "${STEP_VALUE}"
			_sub "${BRIGHTNESS_VALUE}" "${STEP_VALUE}" > ${BRIGHTNESS_FILE}
		fi
	;;

	*) usage ;;
esac
exit 0
