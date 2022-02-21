#!/usr/bin/env bash

#CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
format="%3.1fGHz"

print_cpu_freq() {
	if [ -r "/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq" ]; then
		read freq < "/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq" 
		freq=$(bc -l <<< "${freq}/1000000")
	elif [ -r "/proc/cpuinfo" ]; then
		$read freq < "/proc/cpuinfo"]
	fi

	printf ${format} ${freq}
}

main() {
	print_cpu_freq
}
main

