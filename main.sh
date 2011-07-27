#!/bin/bash
# Proper header for a Bash script.

# Check for root user login
if [ ! $( id -u ) -eq 0 ]; then
	echo "You must be root to run this script."
	echo "Please enter su before running this script again."
	exit
fi

USERNAME=$(logname)
IS_CHROOT=0

# The remastering process uses chroot mode.
# Check to see if this script is operating in chroot mode.
# If /home/$USERNAME exists, then we are not in chroot mode.
if [ -d "/home/$USERNAME" ]; then
	IS_CHROOT=0 # not in chroot mode
	DIR_DEVELOP=/home/$USERNAME/develop 
else
	IS_CHROOT=1 # in chroot mode
	DIR_DEVELOP=/usr/local/bin/develop 
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
