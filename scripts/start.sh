#! /bin/sh

if $2; then
	pip install -r "$2"
fi

pylint -ry "$1" || pylint-exit $?
