#! /bin/sh

if [ $2 ]; then
    pip install -r /tmp/config/"$2"
fi

pylint -ry "$1" || pylint-exit $?
