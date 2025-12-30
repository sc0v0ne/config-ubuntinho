#!/usr/bin/bash

echo "Start installation terminal"

function install_zsh {
    sudo apt install zsh -y
    chsh -s /bin/zsh
}

function install_oh_my_zsh {

    echo "Add OH-MY-ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Add zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    echo "Add zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

# ⚠️ ⚠️ Restart the machine update all packages ⚠️ ⚠️ 

install_zsh
install_oh_my_zsh

echo "Finish installation terminal"