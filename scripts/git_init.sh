#! /bin/bash -ex
# this script should get executed while the rake task is running to create
# the necessary file/folder structure
# you should ONLY call this script from rake task bash:int
# 1 => url to the git repo

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument[url to a git repo] required, $# provided"


cd /$HOME/shell_history_src
git init
git remote add origin "$1"

