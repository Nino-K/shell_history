#! /bin/sh -ex
# This script should get called by etc/rc.local to update user .bash_history
# 1 => target path+fileName

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument[target path, perhaps ~/shell_history_src/history.txt] required, $# provided"


cat "$1" >> ~/.bash_history

