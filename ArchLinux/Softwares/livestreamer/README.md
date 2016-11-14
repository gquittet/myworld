# Install livestreamer to view live inside ArchLinux

## Packages to install

    sudo pacman -S livestreamer mpv gstreamer gstreamer0.10-plugins gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly

## How to read stream

    livestreamer -p ***player*** ***url_here*** ***quality***

Exemple:

    livestreamer -p mpv https://www.youtube.com/watch?v=4KJpXriYC9A best

