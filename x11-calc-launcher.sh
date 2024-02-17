#!/bin/sh

MODEL=""
OPTS=""

_launch() {
# shellcheck disable=SC1090  # intended include
. "${XDG_CONFIG_HOME}"/x11-calc/x11-calc.conf
[ -z "$MODEL" ] && exit 1

case $MODEL in
	10c|11c|12c|15c|16c)
		# if OPTS does not point to a rom file, set expected option to default location
		# no need to check file existence: app will error-out with proper message if missing
		[ -n "${OPTS##*.rom*}" ] || [ -z "${OPTS}" ] && OPTS="-r ${XDG_DATA_HOME}/x11-calc/${MODEL}.rom"
	;;
esac

# shellcheck disable=SC2086  # intended for parameter passsing
exec /app/bin/x11-calc-${MODEL} ${OPTS}
}

_setup() {
nano "${XDG_CONFIG_HOME}"/x11-calc/x11-calc.conf
}


if ! [ -f "${XDG_CONFIG_HOME}"/x11-calc/x11-calc.conf ]; then
	mkdir -p "${XDG_CONFIG_HOME}"/x11-calc
	cat <<-EOF >"${XDG_CONFIG_HOME}"/x11-calc/x11-calc.conf
		MODEL=35
		OPTS=""
		EOF
fi

case $1 in
	--setup)
		_setup
	;;
	*)
		_launch
	;;
esac

