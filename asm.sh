#!/bin/sh
BASE=`dirname $0`
exec python3 $BASE/asm-lib/main.py "$@"
