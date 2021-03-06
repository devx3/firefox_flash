#!/bin/bash
INSTALL_FF_FOLDER=install-ff
FLASHP_VERSION="27.0.0.130"
FIREFOX_VERSION="55.0.3"
BASESYSTEM=$(uname -m) #Get the linux system

#https://fpdownload.adobe.com/get/flashplayer/pdc/27.0.0.130/flash_player_npapi_linux.x86_64.tar.gz

if [ ! -d ./$INSTALL_FF_FOLDER ]; then
	mkdir ./$INSTALL_FF_FOLDER
fi

echo "Downloading Flash Player Plugin..."
wget -P ./$INSTALL_FF_FOLDER https://fpdownload.adobe.com/get/flashplayer/pdc/$FLASHP_VERSION/flash_player_ppapi_linux.$BASESYSTEM.tar.gz

echo "Downloading Firefox..."
wget -P ./$INSTALL_FF_FOLDER https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-$BASESYSTEM/pt-BR/firefox-$FIREFOX_VERSION.tar.bz2

# installing flashplayer 

tar xvzf ./$INSTALL_FF_FOLDER/flash_player_ppapi_linux.$BASESYSTEM.tar.gz -C $INSTALL_FF_FOLDER

sleep 1
echo "installing libs..."
sudo cp -rf ./$INSTALL_FF_FOLDER/libpepflashplayer.so /usr/lib/mozilla/plugins
sudo cp -rf ./$INSTALL_FF_FOLDER/usr/* /usr/

sleep 1
echo "Extracting firefox..."
tar xvjf ./$INSTALL_FF_FOLDER/firefox-$FIREFOX_VERSION.tar.bz2 -C $INSTALL_FF_FOLDER

