#!/bin/sh

IN=$1

grep -v '^\s*$' $IN | tr 'a-z' 'A-Z' > $1.out

