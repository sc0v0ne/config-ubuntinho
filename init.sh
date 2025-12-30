#!/usr/bin/bash

echo "==================================="
echo "Start install packages"

echo "==================================="
sudo apt update -y
sudo apt upgrade -y
echo "==================================="
echo "ADD PACKAGES"

source packages.sh

echo "==================================="
echo "CONFIG TERMINAL"
source terminal.sh

echo "==================================="
echo "Install BREW"

function install_brew {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export HOMEBREW_API_DOMAIN=https://artifacts.example.com/artifactory/homebrew-formulae-api
    export HOMEBREW_ARTIFACT_DOMAIN=https://artifacts.example.com/artifactory/homebrew
    export HOMEBREW_ARTIFACT_DOMAIN_NO_FALLBACK=1
    export HOMEBREW_DOCKER_REGISTRY_BASIC_AUTH_TOKEN="$(printf 'anonymous:' | base64)"

}

install_brew

echo "==================================="
echo "Install SNAP"

source snap_packages.sh

echo "==================================="
echo "Install "


curl -sSL https://install.python-poetry.org | python3 -

curl -fsSL https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc


echo "Finish install packages"
echo "==================================="