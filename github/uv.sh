. github/tools.sh
. ./utils.sh



download_uv() {
	NAME="uv"
	REPO="astral-sh/uv"


	if command -v uv > /dev/null; then
		echo "\e[32m$NAME exists.\e[0m"
		return 1
	fi


	echo -n "Downloading \e[94m$NAME"
	LAST_VERSION=$(version $REPO)
	echo " -> $LAST_VERSION\e[0m"


	TARBALL="${NAME}-${ARCH}-${OS}.tar.gz"
	URL="https://github.com/${REPO}/releases/download/${LAST_VERSION}/${TARBALL}"
	echo "URL:\t$URL"
	if ! download_tar $URL; then
		echo "\e[31mFAILD\e[0m $NAME" >&2
		return 1
	fi


	tar -xzf "$TARBALL" --strip-components=1
	cp $NAME ../.
	cp uvx ../.
}
