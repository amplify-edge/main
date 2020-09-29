#!/usr/bin/env bash

tail -n 20 ./ENV >> ~/.profile

SHELLNAME="${SHELL##*/}"
case $SHELLNAME in
    fish)
        bax source ~/.profile
        ;;
    zsh)
        echo "emulate sh -c '. $HOME/.profile'" | tee "$HOME"/.zprofile
        ;;
    *)
        source ~/.profile
        ;;
esac   