#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
	${CURRENT_DIR}/scripts/cpufreq.sh
}
main
