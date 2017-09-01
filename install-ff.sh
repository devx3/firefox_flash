#!/bin/bash
INSTALL_FF_FOLDER=install-ff
FLASHP_VERSION="26.0.0.151"
FIREFOX_VERSION="55.0.3"
BASESYSTEM=$(uname -m) #Get the linux system

if [ ! -d ./$INSTALL_FF_FOLDER ]; then
	mkdir ./$INSTALL_FF_FOLDER
fi

wget -P ./$INSTALL_FF_FOLDER https://fpdownload.adobe.com/pub/flashplayer/pdc/$FLASHP_VERSION/flash_player_ppapi_linux.$BASESYSTEM.tar.gz

wget -P ./$INSTALL_FF_FOLDER https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-$BASESYSTEM/pt-BR/firefox-$FIREFOX_VERSION.tar.bz2

# installing flashplayer 
tar xvzf ./$INSTALL_FF_FOLDER/flash_player_ppapi_linux.$BASESYSTEM.tar.gz -C $INSTALL_FF_FOLDER
sudo cp -rf ./$INSTALL_FF_FOLDER/libpepflashplayer.so /usr/lib/mozilla/plugins
sudo cp -rf ./$INSTALL_FF_FOLDER/usr/* /usr/

tar xvjf ./$INSTALL_FF_FOLDER/firefox-$FIREFOX_VERSION.tar.bz2 -C $INSTALL_FF_FOLDER

