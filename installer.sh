#!/bin/sh

if [ $# -ne 0 ]; then
    echo "Don't give any arguments"
    exit 1
fi

#make plugin dir
echo "===== checking if plugin dir exists ====="
PLUGIN_DIR="$PWD/plugins"
if ! [ -e $PLUGIN_DIR ]; then
    echo "making plugin dir..."
    echo "$PLUGIN_DIR"
    mkdir -p "$PLUGIN_DIR"
else
    echo "plugin dir already exists"
fi
echo""

# Convert the installation directory to absolute path
echo "===== checking if installation directory exists ====="
INSTALL_DIR="${PLUGIN_DIR}/repos/github.com/Shougo/dein.vim"
if ! [ -e "$INSTALL_DIR" ]; then
    echo "Install to \"$INSTALL_DIR\"..."
else
    echo "\"$INSTALL_DIR\""
    echo " already exists"
fi
echo ""

# check git command
echo "===== checking the git command ====="
type git || {
    echo 'Please install git or update your path to include the git executable!'
    exit 1
}
echo ""

# make plugin dir and fetch dein
if ! [ -e "$INSTALL_DIR" ]; then
    echo "Begin fetching dein..."
    git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
    echo "Done."
    echo ""
fi

#make undo dir
echo "===== checking if undo directory exists ====="
UNDO_DIR="$HOME/.vim/.vimundo"
if ! [ -e "$UNDO_DIR" ]; then
    echo "making undo dir..."
    mkdir -p "$UNDO_DIR"
else
    echo "undo dir already exists"
fi
echo ""

echo "Done."
echo "Complete setup dein!"
