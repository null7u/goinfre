. github/tools.sh




download_go() {
	NAME="go"
	

	if command -v go > /dev/null; then
		echo "\e[32m$NAME exists.\e[0m"
		return 1
	fi


	echo -n "Downloading \e[94m$NAME"
	LAST_VERSION="$1"
	echo " -> $LAST_VERSION\e[0m"

	mkdir -p $BIN_PATH/folders
	cd $BIN_PATH/folders


	TARBALL="${NAME}${LAST_VERSION}.linux-amd64.tar.gz"
	URL="https://go.dev/dl/$TARBALL"
	echo "URL:\t$URL"
	if ! download_tar $URL; then
		echo "\e[31mFAILD\e[0m $NAME" >&2
		return 1
	fi


	tar -xf "$TARBALL" 
	rm $TARBALL

	ln -s $BIN_PATH/folders/go/bin/go $BIN_PATH/go
	ln -s $BIN_PATH/folders/go/bin/gofmt $BIN_PATH/gofmt
}
