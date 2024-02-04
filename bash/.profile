export EMACS_SOCKET_NAME="$HOME/.emacs.d/server/server"
export KERL_BUILD_DOCS=yes

if [ -d "/Applications/Emacs.app/Contents/MacOS/bin" ]; then
    PATH="/Applications/Emacs.app/Contents/MacOS/bin:$PATH"
fi

if [ -d "/Applications/Sublime Text.app/Contents/SharedSupport/bin" ]; then
    PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
fi

export PATH="$HOME/bin:$HOME/go/bin:/Library/TeX/texbin:/opt/local/bin:/opt/local/sbin:$PATH"

if [ -f $HOME/.asdf/asdf.sh ]; then
	. $HOME/.asdf/asdf.sh
fi
