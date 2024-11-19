#!/bin/sh

install(){
podman buid -f Dockerfile -t vmcii .
mkdir Heroes_3_Files
mkdir config
}

launcher(){
    xhost +local:root
    podman run --rm -e DISPLAY=$DISPLAY -ti \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $(pwd)/config:/root/.config/vcmi \
    -v $(pwd)/Heroes_3_Files:/root/.local/share/vcmi vmcii /usr/games/vcmilauncher
}

client(){
    xhost +local:root
    podman run --rm -e DISPLAY=$DISPLAY -ti \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $(pwd)/config:/root/.config/vcmi \
    -v $(pwd)/Heroes_3_Files:/root/.local/share/vcmi vmcii /usr/games/vcmiclient
}


if [ "$1" = "client" ]; then
    client
elif [ "$1" = "launcher" ]; then
    launcher
elif [ "$1" = "install" ];
    install
else
    echo """
    Usage:
    $0 launcher - Start launcher and configure VMCII
    $0 client - Start VMCII
    $0 install - Build container and crerate two directories
    """
fi
