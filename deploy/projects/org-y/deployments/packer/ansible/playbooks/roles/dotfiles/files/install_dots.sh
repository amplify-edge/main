#!/usr/bin/env bash

find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n' | xargs stow