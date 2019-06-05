#!/bin/zsh -f
# Purpose: Keyboard Maestro script for when Wi-Fi disconnects
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2019-06-04

NAME="$0:t:r"

if [[ -e "$HOME/.path" ]]
then
	source "$HOME/.path"
else
	PATH='/usr/local/scripts:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin'
fi

	# This script _will_ be called when you are switching Wi-Fi networks, so let's allow
	# for a short delay to see if we have picked up a new Wi-Fi network before we toggle
	# Wi-Fi off and then on again.
sleep 10

	# This is the best way that I've found to find the SSID that you are currently connected to.
	# although you could use `networksetup -getairportnetwork en0 | sed 's#^Current Wi-Fi Network: ##g'`
	# that requires that you know which port is your Wireless port (en0, in the above example)
	# and it's also called "Airport" instead of "Wi-Fi" in some older versions of Mac OS X, I think.
	#
	# `sudo wdutil info | awk -F': ' '/ SSID/{print $NF}'` would also work, but it requires `sudo`
	#
	# I don't know why Apple keeps `airport` in this weird path, but it's been there forever, so
	# I'm happy to use it, even though I "shouldn't".
	#
	# The other advantage is that it will give empty output, whereas `networksetup` does not use
	# stderr properly when there is no SSID.
	#
SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null \
		| awk -F': ' '/ SSID/{print $NF}')

if [[ "$SSID" == "" ]]
then
		# OK, so if we get here, there is no SSID, which means either that Wi-Fi is off
		# or that we've been disconnected for some reason

		# If AirPort is OFF, we'll assume that was on purpose for some reason
		# so let's check that first:
	IS_AIRPORT_OFF=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)

		# this is what we'll get from `airport -I` when AirPort is powered off
	YES_AIRPORT_IS_OFF='AirPort: Off'

	if [[ "$IS_AIRPORT_OFF" == "$YES_AIRPORT_IS_OFF" ]]
	then

			# if we get here, just report our status and quit
		echo "$NAME: AirPort is powered off."

		exit 0

	else

			# if we get here, AirPort is on, but not connected to a Wi-Fi network
			# so we'll turn AirPort off and on -- on purpose -- which will
			# hopefully have the effect of getting us re-connected to the Wi-Fi.
		WIFI_PORT=$(networksetup -listallhardwareports \
			| grep -E '(Wi-Fi|AirPort)' -A 1 \
			| grep -o "en.")


			# This is where we turn off power to it
		networksetup -setairportpower "${WIFI_PORT}" off

			# give it a second for things to settle down
		sleep 3

			# now turn it back on
		networksetup -setairportpower "${WIFI_PORT}" on

			# now let the user know what we've done
		echo "$NAME: Wi-Fi power toggled on '$WIFI_PORT'."

	fi

else
		# If we're on a Wi-Fi network, then we don't need to do anything other than
		# tell the user
	echo "$NAME: Wi-Fi network found:\n${SSID}"

fi

exit 0
#
#EOF
