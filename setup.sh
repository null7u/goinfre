#!/bin/zsh
. github/bat.sh
. github/lsd.sh
. github/nvim.sh
. github/uv.sh
. custom/go.sh
. custom/flutter.sh
. custom/zig.sh

export ARCH=$(uname -m)
export OS="unknown-linux-gnu"

export BIN_PATH=$HOME/goinfre/bin


mkdir -p $BIN_PATH


download_zig "0.15.2"
download_bat
download_lsd
download_uv



download_nvim
download_go "1.25.3"
download_flutter



cd ..
rm -rf tmp
