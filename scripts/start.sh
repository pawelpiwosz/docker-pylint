#! /bin/sh

pylint -ry $1 || pylint-exit $?
