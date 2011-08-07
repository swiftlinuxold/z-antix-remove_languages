#!/bin/bash
# Proper header for a Bash script.

# Check for root user login
if [ ! $( id -u ) -eq 0 ]; then
	echo "You must be root to run this script."
	echo "Please enter su before running this script again."
	exit 2
fi

IS_CHROOT=0 # changed to 1 if and only if in chroot mode
USERNAME=""
DIR_DEVELOP=""

# The remastering process uses chroot mode.
# Check to see if this script is operating in chroot mode.
# /srv directory only exists in chroot mode
if [ -d "/srv" ]; then
	IS_CHROOT=1 # in chroot mode
	DIR_DEVELOP=/usr/local/bin/develop 
else
	USERNAME=$(logname) # not in chroot mode
	DIR_DEVELOP=/home/$USERNAME/develop 
fi

echo "******************************************************************"
echo "BEGIN REMOVING LANGAUGES"

# NOTE: BleachBit does NOT remove languages from /usr/share/antiX/localisation
rm -r /usr/share/antiX/localisation/ar
rm -r /usr/share/antiX/localisation/bg
rm -r /usr/share/antiX/localisation/ca
rm -r /usr/share/antiX/localisation/cn
rm -r /usr/share/antiX/localisation/cs
rm -r /usr/share/antiX/localisation/da
rm -r /usr/share/antiX/localisation/de
rm -r /usr/share/antiX/localisation/el
rm -r /usr/share/antiX/localisation/es
rm -r /usr/share/antiX/localisation/et
rm -r /usr/share/antiX/localisation/eu
rm -r /usr/share/antiX/localisation/fa
rm -r /usr/share/antiX/localisation/fi
rm -r /usr/share/antiX/localisation/fr
rm -r /usr/share/antiX/localisation/hr
rm -r /usr/share/antiX/localisation/hu
rm -r /usr/share/antiX/localisation/is
rm -r /usr/share/antiX/localisation/it
rm -r /usr/share/antiX/localisation/ja
rm -r /usr/share/antiX/localisation/ko
rm -r /usr/share/antiX/localisation/lt
rm -r /usr/share/antiX/localisation/mk
rm -r /usr/share/antiX/localisation/nl
rm -r /usr/share/antiX/localisation/no
rm -r /usr/share/antiX/localisation/pl
rm -r /usr/share/antiX/localisation/pt
rm -r /usr/share/antiX/localisation/pt-br
rm -r /usr/share/antiX/localisation/ro
rm -r /usr/share/antiX/localisation/ru
rm -r /usr/share/antiX/localisation/sk
rm -r /usr/share/antiX/localisation/sl
rm -r /usr/share/antiX/localisation/sq
rm -r /usr/share/antiX/localisation/sr
rm -r /usr/share/antiX/localisation/sv
rm -r /usr/share/antiX/localisation/tr
rm -r /usr/share/antiX/localisation/ua


# Add BleachBit (highlights unnecessary files for deletion)
echo "Adding BleachBit"
apt-get install --force-yes bleachbit

# Configure BleachBit
rm /root/.config/bleachbit # Removes the file /root/.config/bleachbit
mkdir /root/.config/bleachbit # Created the folder /root/.config/bleachbit
cp $DIR_DEVELOP/remove_languages/root_config_bleachbit/bleachbit.ini /root/.config/bleachbit
chown root:root /root/.config/bleachbit/bleachbit.ini
bleachbit --delete system.localizations

# Remove all languages other than English (over 200MB on hard drive)
bleachbit cli --preset -d

echo "FINISHED REMOVING LANGAUGES"
echo "******************************************************************"

exit 0
