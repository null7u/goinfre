. github/tools.sh
. ./utils.sh



download_bat() {
	NAME="bat"
	REPO="sharkdp/bat"
	cd_tmp_dir


	if command -v bat > /dev/null; then
		echo "\e[32m$NAME exists.\e[0m"
		return 1
	fi


	echo -n "Downloading \e[94m$NAME"
	LAST_VERSION=$(version $REPO)
	echo " -> $LAST_VERSION\e[0m"


	TARBALL="${NAME}-${LAST_VERSION}-${ARCH}-${OS}.tar.gz"
	URL="https://github.com/${REPO}/releases/download/${LAST_VERSION}/${TARBALL}"
	echo "URL:\t$URL"
	if ! download_tar $URL; then
		echo "\e[31mFAILD\e[0m $NAME" >&2
		return 1
	fi


	tar -xzf "$TARBALL" --strip-components=1
	cp $NAME ../.
}
