function snap_install {
    sudo apt update
    sudo apt install snapd
}

function check_snap {
    sudo snap install hello-world
    output=$(hello-world)
    if [ output -eq 'Hello World!' ]; then
        echo "Check Ok Snap Packages !!!"
    else
        echo "Exception: was unable to install snap"
    fi
}


function packages_snap {
    sudo snap install cloudcompare
    sudo snap install spotify
    sudo snap install postman
    sudo snap install obsidian --classic
    sudo snap install todoist
    
}

snap_install
check_snap
packages_snap