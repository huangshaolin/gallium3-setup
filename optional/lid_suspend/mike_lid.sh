#!/bin/bash

xuser="$(ps -o uname= $(pidof xfce4-session))"
[ -z "${xuser}" ] && exit 0

conf="/home/${xuser}/.local/mike_lid/suspend-on-lid-close.conf"
[ ! -f "${conf}" ] && exit 0

! grep -q 'enable=true' "${conf}" && exit 0

grep -q 'open' /proc/acpi/button/lid/LID0/state && exit 0


start_time="$(date +%s)"
sleep 6
grep -q 'open' /proc/acpi/button/lid/LID0/state && exit 0
(( "$(date +%s)" - "${start_time}" > 8 )) && exit 0

on_ac='true'
{ upower -i $(upower -e | grep 'BAT') | grep -qE 'state:.*discharging'; } && on_ac='false'

if [ "${on_ac}" == 'true' ] && grep -q 'on_ac=true' "${conf}" \
	|| [ "${on_ac}" == 'false' ] && grep -q 'on_battery=true' "${conf}"; then
	echo "$(date +%T): " >> /tmp/mike_lid.log
	systemctl suspend -i >> /tmp/mike_lid.log 2>&1
fi

