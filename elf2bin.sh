#!/bin/sh

set -eu
cd `dirname $0`/elf2bin-lib/elf2bin

pipenv run start "$@"
