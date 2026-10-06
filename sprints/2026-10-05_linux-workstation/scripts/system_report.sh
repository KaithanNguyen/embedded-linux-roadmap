#!/usr/bin/env bash
# Read-only, best-effort report. Missing tools do not abort collection.
set -u
run_probe() {
    local title="$1"
    shift
    printf '\n## %s\n' "$title"
    if ! command -v "$1" >/dev/null 2>&1; then
        printf 'WARN: command unavailable: %s\n' "$1"
        return 0
    fi
    "$@" 2>&1
    local rc=$?
    if (( rc != 0 )); then
        printf 'WARN: probe exited with status %s\n' "$rc"
    fi
    return 0
}
printf '# Linux system report\n'
run_probe "Time (UTC)" date -u '+%Y-%m-%dT%H:%M:%SZ'
run_probe "Kernel and architecture" uname -srmo
if [[ -r /etc/os-release ]]; then
    run_probe "OS release" cat /etc/os-release
else
    printf '\nWARN: /etc/os-release is not readable\n'
fi
run_probe "CPU" lscpu
run_probe "Memory" free -h
run_probe "Block devices" lsblk
run_probe "Filesystem usage" df -h
run_probe "Git" git --version
run_probe "C compiler" gcc --version
run_probe "C++ compiler" g++ --version
run_probe "Make" make --version
run_probe "Debugger" gdb --version
printf '\n# Collection complete (best effort); review WARN entries.\n'
