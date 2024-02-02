#!/bin/sh

MODEL=""
OPTS=""

if ! [ -f "${XDG_CONFIG_HOME}"/x11-calc.conf ]; then
	cat <<-EOF >"${XDG_CONFIG_HOME}"/x11-calc.conf
		MODEL=35
		OPTS=""
		EOF
fi
. "${XDG_CONFIG_HOME}"/x11-calc.conf
[ -z "$MODEL" ] && exit 1

case $MODEL in
	10c|11c|12c|15c|16c)
		# if OPTS does not point to a rom file, set expected option to default location
		# no need to check file existence: app will error-out with proper message if missing
		[ -n "${OPTS##*.rom*}" ] || [ -z "${OPTS}" ] && OPTS="-r ${XDG_DATA_HOME}/${MODEL}.rom"
	;;
esac

exec /app/bin/x11-calc-${MODEL} ${OPTS}

