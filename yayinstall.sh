#!/bin/bash
# migrate to paru
git clone https://aur.archlinux.org/paru
cd paru
makepkg -sir
rm -rf ../paru
