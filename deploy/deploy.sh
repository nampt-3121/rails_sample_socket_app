#!/bin/bash

REMOTE_USER="ubuntu"
REMOTE_HOST="3.112.124.141"
SSH_KEY="./deploy/GoldenVM.pem"

release_version=$(date "+%Y%m%d%H%M%S")

# Chạy lệnh trên server
sudo ssh -i "$SSH_KEY" "$REMOTE_USER@$REMOTE_HOST" << EOF
    echo "Switch to user deploy"
    sudo su - deploy

    echo "======================================"

    echo "Pull source code"
    cd /home/deploy/app/repo
    git checkout main
    git pull

    echo "======================================"
    
    echo "Create release folder"
    cd /home/deploy/app/releases
    mkdir $release_version

    cp -a /home/deploy/app/repo/. /home/deploy/app/releases/$release_version

    echo "======================================"
    
    echo "Create sympolink from current"
    rm -rf /home/deploy/app/current
    ln -s /home/deploy/app/releases/$release_version/. /home/deploy/app/current
EOF

echo "SSH connect is closed."
