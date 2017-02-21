#!/bin/sh

RUN_MODES="ram rom"
THUMB_VARS="NO YES"
DEBUG_VARS="NO YES"

for mode in $RUN_MODES; do
	RM=RUN_FROM_$(echo $mode | tr 'a-z' 'A-Z')
	for thumb in $THUMB_VARS; do
		for d in $DEBUG_VARS; do
			[ "$d" = "YES" ] && DEBUG=-g || DEBUG=''
			D=../../build-${mode}_thumb${thumb}_dbg${d}
			mkdir -p $D
			cat <<EOCFG > $D/tup.config
CONFIG_RUN_MODE=$RM
CONFIG_LDSCRIPT=atmel-${mode}.ld
CONFIG_DEBUG=$DEBUG
CONFIG_USE_THUMB_MODE=$thumb

EOCFG
		done
	done
done
