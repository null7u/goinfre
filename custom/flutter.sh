







download_flutter(){

	NAME="flutter"
	

	if command -v flutter > /dev/null; then
		echo "\e[32m$NAME exists.\e[0m"
		return 1
	fi


	echo "Downloading \e[94m$NAME\e[0m"

	mkdir -p $BIN_PATH/folders
	cd $BIN_PATH/folders

	local URL="https://github.com/flutter/flutter.git"
	echo "URL:\t$URL"
	

	git clone $URL -b stable --depth=1


	ln -s $BIN_PATH/folders/$NAME/bin/$NAME $BIN_PATH/$NAME
	ln -s $BIN_PATH/folders/$NAME/bin/dart $BIN_PATH/dart
	flutter
	flutter doctor
	dart
}

