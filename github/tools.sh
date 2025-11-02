



version(){
	local REPO="$1"
	curl -s "https://api.github.com/repos/$REPO/releases/latest"| grep -Po '"tag_name": "\K.*?(?=")'
}


download_tar(){
	local URL="$1"
	if ! curl -fsSL -O "$URL"; then
    		exit 1
	fi
}
