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

exit 0
