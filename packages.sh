#!/usr/bin/bash

echo "Initialize installation packages"


libs_ok=()
libs_fail=()
libs=(
    "build-essential"
    "python3-pip"
    "libssl-dev"
    "zlib1g-dev"
    "libbz2-dev"
    "libreadline-dev"
    "libsqlite3-dev"
    "curl"
    "libncursesw5-dev"
    "xz-utils"
    "tk-dev"
    "libxml2-dev"
    "libxmlsec1-dev"
    "libffi-dev"
    "liblzma-dev"
    "gcc"
    "git"
    )

for lib in "${libs[@]}"; do
    if apt-cache search "$lib" > /dev/null; then
        libs_ok+=("$lib")
    else
        libs_fail+=("$lib")
    fi
done

function install_classics (){
    local libs_ok=("$@")
    for lib in "${libs_ok[@]}"; do
        echo "Installing => $lib"
        sudo apt install "$lib" -y
    done
}

install_classics "${libs_ok[@]}"

function show_fails (){
    local libs_fails=("$@")
    echo "Libs Fail Installing !!!"
    for lib in "${libs_fails[@]}"; do
        echo "Fail Install => $lib"
    done
}

show_fails "${libs_fails[@]}"


echo "Finish install packages"