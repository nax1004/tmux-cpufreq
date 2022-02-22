#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helpers.sh"

cpufreq_output="#($CURRENT_DIR/scripts/cpufreq.sh)"
cpufreq_interpolation="\#{cpufreq}"

do_interpolation() {
	local string="$1"
	local output="${string/$cpufreq_interpolation/$cpufreq_output}"
	echo "$output"
}

update_tmux_cpufreq() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_cpufreq "status-right"
	update_tmux_cpufreq "status-left"
}

#echo "CURRENT_DIR=${CURRENT_DIR}"
#echo "cpufreq_output=${cpufreq_output}"
#echo "cpufreq_interpolation=${cpufreq_interpolation}"

main

