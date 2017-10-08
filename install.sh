#!/bin/bash

# Download quotes
curl -s https://raw.githubusercontent.com/vsbuffalo/good-news-everyone/master/futurama.txt | awk '{print $0} END{print "Total quotes: "NR > "/dev/stderr"}' > ~/.futurama
shuf="shuf"
# Mac OSX specific
if [[ "$(uname -s)" == "Mac OS X" ]]; then
    shuf="gshuf"
    brew install coreutils
fi
# Install into profile
if [ -f ~/.zshrc ]; then
    dest=~/.zshrc
else
    dest=~/.profile
fi
echo "$shuf -n1 ~/.futurama" >> $dest
echo "Installed into $dest"
