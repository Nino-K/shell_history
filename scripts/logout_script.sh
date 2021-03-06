#! /bin/sh -ex
# this script should get executed upon user logout to commit the
# latest changes in ~/shell_history_src
# 1 => target path

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument[target path, perhaps ~/shell_history_src] required, $# provided"


# change this path to the designated path after installation

cd /home/nino/RubymineProjects/shell_history

ruby log_out.rb

cd "$1"

git add . -A

git commit -m "testing"

git push origin master
