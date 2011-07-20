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

rm -r /usr/share/locale/af
rm -r /usr/share/locale/am
rm -r /usr/share/locale/an
rm -r /usr/share/locale/ang
rm -r /usr/share/locale/ar
rm -r /usr/share/locale/ar_EG
rm -r /usr/share/locale/ar_PS
rm -r /usr/share/locale/as
rm -r /usr/share/locale/ast
rm -r /usr/share/locale/az
rm -r /usr/share/locale/az_IR
rm -r /usr/share/locale/bal
rm -r /usr/share/locale/be
rm -r /usr/share/locale/be@latin
rm -r /usr/share/locale/be@tarask
rm -r /usr/share/locale/bg
rm -r /usr/share/locale/bn
rm -r /usr/share/locale/bn_IN
rm -r /usr/share/locale/br
rm -r /usr/share/locale/bs
rm -r /usr/share/locale/byn
rm -r /usr/share/locale/ca
rm -r /usr/share/locale/ca@valencia
rm -r /usr/share/locale/ckb
rm -r /usr/share/locale/crh
rm -r /usr/share/locale/cs
rm -r /usr/share/locale/cy
rm -r /usr/share/locale/da
rm -r /usr/share/locale/de
rm -r /usr/share/locale/de_DE
rm -r /usr/share/locale/dz
rm -r /usr/share/locale/el
rm -r /usr/share/locale/eo
rm -r /usr/share/locale/es
rm -r /usr/share/locale/es_AR
rm -r /usr/share/locale/es_CL
rm -r /usr/share/locale/es_CO
rm -r /usr/share/locale/es_ES
rm -r /usr/share/locale/es_GT
rm -r /usr/share/locale/es_MX
rm -r /usr/share/locale/es_NI
rm -r /usr/share/locale/es_VE
rm -r /usr/share/locale/et
rm -r /usr/share/locale/et_EE
rm -r /usr/share/locale/eu
rm -r /usr/share/locale/fa
rm -r /usr/share/locale/fi
rm -r /usr/share/locale/fil
rm -r /usr/share/locale/fo
rm -r /usr/share/locale/fr
rm -r /usr/share/locale/fr_CA
rm -r /usr/share/locale/fr_FR
rm -r /usr/share/locale/fur
rm -r /usr/share/locale/ga
rm -r /usr/share/locale/gez
rm -r /usr/share/locale/gl
rm -r /usr/share/locale/gu
rm -r /usr/share/locale/gv
rm -r /usr/share/locale/haw
rm -r /usr/share/locale/he
rm -r /usr/share/locale/hi
rm -r /usr/share/locale/hr
rm -r /usr/share/locale/hr_HR
rm -r /usr/share/locale/hrx
rm -r /usr/share/locale/hu
rm -r /usr/share/locale/hy
rm -r /usr/share/locale/ia
rm -r /usr/share/locale/id
rm -r /usr/share/locale/io
rm -r /usr/share/locale/is
rm -r /usr/share/locale/it
rm -r /usr/share/locale/it_IT
rm -r /usr/share/locale/ja
rm -r /usr/share/locale/ka
rm -r /usr/share/locale/kk
rm -r /usr/share/locale/km
rm -r /usr/share/locale/kn
rm -r /usr/share/locale/ko
rm -r /usr/share/locale/kok
rm -r /usr/share/locale/ku
rm -r /usr/share/locale/ky
rm -r /usr/share/locale/la
rm -r /usr/share/locale/lb
rm -r /usr/share/locale/lg
rm -r /usr/share/locale/li
rm -r /usr/share/locale/lo
rm -r /usr/share/locale/lt
rm -r /usr/share/locale/lv
rm -r /usr/share/locale/mai
rm -r /usr/share/locale/mg
rm -r /usr/share/locale/mhr
rm -r /usr/share/locale/mi
rm -r /usr/share/locale/mk
rm -r /usr/share/locale/ml
rm -r /usr/share/locale/mn
rm -r /usr/share/locale/mr
rm -r /usr/share/locale/ms
rm -r /usr/share/locale/ms_MY
rm -r /usr/share/locale/mt
rm -r /usr/share/locale/my
rm -r /usr/share/locale/my_MM
rm -r /usr/share/locale/nb
rm -r /usr/share/locale/nb_NO
rm -r /usr/share/locale/nds
rm -r /usr/share/locale/ne
rm -r /usr/share/locale/nl
rm -r /usr/share/locale/nl_NL
rm -r /usr/share/locale/nn
rm -r /usr/share/locale/no
rm -r /usr/share/locale/nso
rm -r /usr/share/locale/oc
rm -r /usr/share/locale/or
rm -r /usr/share/locale/pa
rm -r /usr/share/locale/pl
rm -r /usr/share/locale/pl_PL
rm -r /usr/share/locale/ps
rm -r /usr/share/locale/pt
rm -r /usr/share/locale/pt_BR
rm -r /usr/share/locale/pt_PT
rm -r /usr/share/locale/rm
rm -r /usr/share/locale/ro
rm -r /usr/share/locale/ru
rm -r /usr/share/locale/ru_RU
rm -r /usr/share/locale/rw
rm -r /usr/share/locale/si
rm -r /usr/share/locale/sk
rm -r /usr/share/locale/sl
rm -r /usr/share/locale/sl_SI
rm -r /usr/share/locale/so
rm -r /usr/share/locale/sp
rm -r /usr/share/locale/sq
rm -r /usr/share/locale/sr
rm -r /usr/share/locale/sr@ije
rm -r /usr/share/locale/sr@latin
rm -r /usr/share/locale/sr@Latn
rm -r /usr/share/locale/sv
rm -r /usr/share/locale/sv_SE
rm -r /usr/share/locale/sw
rm -r /usr/share/locale/ta
rm -r /usr/share/locale/te
rm -r /usr/share/locale/tg
rm -r /usr/share/locale/th
rm -r /usr/share/locale/ti
rm -r /usr/share/locale/tig
rm -r /usr/share/locale/tk
rm -r /usr/share/locale/tl
rm -r /usr/share/locale/tl_PH
rm -r /usr/share/locale/tr
rm -r /usr/share/locale/tt
rm -r /usr/share/locale/ug
rm -r /usr/share/locale/uk
rm -r /usr/share/locale/ur
rm -r /usr/share/locale/ur_PK
rm -r /usr/share/locale/uz
rm -r /usr/share/locale/uz@cyrillic
rm -r /usr/share/locale/ve
rm -r /usr/share/locale/vi
rm -r /usr/share/locale/wa
rm -r /usr/share/locale/wal
rm -r /usr/share/locale/wo
rm -r /usr/share/locale/xh
rm -r /usr/share/locale/yi
rm -r /usr/share/locale/zh
rm -r /usr/share/locale/zh_CN
rm -r /usr/share/locale/zh_CN.GB2312
rm -r /usr/share/locale/zh_HK
rm -r /usr/share/locale/zh_TW
rm -r /usr/share/locale/zh_TW.Big5
rm -r /usr/share/locale/zu

# Add BleachBit (highlights unnecessary files for deletion)
echo "Adding BleachBit"
apt-get install --force-yes bleachbit

# Configure BleachBit
bleachbit_cli # Creates /root/.config/bleachbit file
rm /root/.config/bleachbit # Removes the file /root/.config/bleachbit
mkdir /root.config/bleachbit # Created the folder /root/.config/bleachbit
cp $DIR_DEVELOP/remove_languages/root_config_bleachbit/bleachbit.ini /root/.config/bleachbit
chown root:root /root/.config/bleachbit/bleachbit.ini

# Remove all languages other than English (over 200MB on hard drive)
bleachbit cli --preset -d
