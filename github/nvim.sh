. github/tools.sh




download_nvim() {
	NAME="nvim"
	REPO="neovim/neovim"


	if command -v nvim > /dev/null; then
		echo "\e[32m$NAME exists.\e[0m"
		return 1
	fi


	echo -n "Downloading \e[94m$NAME"
	LAST_VERSION=$(version $REPO)
	echo " -> $LAST_VERSION\e[0m"

	mkdir -p $BIN_PATH/folders
	cd $BIN_PATH/folders

	TARBALL="${NAME}-linux-${ARCH}.tar.gz"
	URL="https://github.com/${REPO}/releases/download/${LAST_VERSION}/${TARBALL}"
	echo "URL:\t$URL"
	if ! download_tar $URL; then
		echo "\e[31mFAILD\e[0m $NAME" >&2
		return 1
	fi


	tar -xf "$TARBALL"
	rm $TARBALL

	local FILE_NAME=$(basename $TARBALL .tar.gz)

	
	ln -s $BIN_PATH/folders/$FILE_NAME/bin/nvim $BIN_PATH/nvim
}
