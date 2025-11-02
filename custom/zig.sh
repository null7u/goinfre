. github/tools.sh
. ./utils.sh



download_zig() {
	NAME="zig"

	if command -v zig > /dev/null; then
		echo "\e[32m$NAME exists.\e[0m"
		return 1
	fi


	echo -n "Downloading \e[94m$NAME"
	local LAST_VERSION="$1"
	echo " -> $LAST_VERSION\e[0m"


	mkdir -p $BIN_PATH/folders
	cd $BIN_PATH/folders


	TARBALL="zig-x86_64-linux-${LAST_VERSION}.tar.xz"
	URL="https://ziglang.org/download/${LAST_VERSION}/$TARBALL"
	echo "URL:\t$URL"
	if ! download_tar $URL; then
		echo "\e[31mFAILD\e[0m $NAME" >&2
		return 1
	fi

	tar -xf "$TARBALL" 
	rm $TARBALL

	local FILE_NAME=$(basename $TARBALL .tar.xz)

	ln -s $BIN_PATH/folders/$FILE_NAME/$NAME $BIN_PATH/$NAME

}
