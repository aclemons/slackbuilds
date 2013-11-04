#!/bin/sh
set -e

MACROMEDIA_PATH_USER="/.macromedia"
ADDIN_TARGET_PATH_USER="/.macromedia/Flash_Player/www.macromedia.com/bin/connectaddin/"
ADDIN_TARGET_ABS_PATH=$HOME$ADDIN_TARGET_PATH_USER

rm -rf $ADDIN_TARGET_ABS_PATH
mkdir -p $ADDIN_TARGET_ABS_PATH

cd $ADDIN_TARGET_ABS_PATH

ln -s /usr/share/adobe-connect-addin/connectaddin
ln -s /usr/share/adobe-connect-addin/digest.s

