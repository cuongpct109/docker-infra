#!/bin/bash

# shutdown and removing necessary data

eval "$(curl https://raw.githubusercontent.com/cuongpct109/skipid-infra/main/shutdown.sh)"

# Check and remove existing old folders if needed

if [ -d ~/Documents/dbs ] 
then
    rm -rf ~/Documents/dbs
    echo "~/Documents/dbs removed"
else
    :
fi

if [ -d ~/Downloads/datastack ]    
then
    rm -rf ~/Downloads/datastack
    echo "~/Downloads/datastack removed"
else
    :
fi


if [ -f ~/Downloads/datastack.tar.gz ]
then
    rm -rf ~/Downloads/datastack.tar.gz
    echo "~/Downloads/datastack.tar.gz removed"
else 
    :
fi


# Update

sudo apt update;

# Check and install wget and curl if needed

if [ -z "$(dpkg -l | grep -E '^ii' | grep wget)" ]
then
      sudo apt install -y wget
else
      echo "wget've already installed in this computer"
fi

if [ -z "$(dpkg -l | grep -E '^ii' | grep curl)" ]
then
      sudo apt install -y curl
else
      echo "curl've already installed in this computer"
fi

# Check and install docker, docker-compose, containerd if needed

if [ -z "$(dpkg -l | grep -E '^ii' | grep docker)" ]
then
      sudo apt install -y docker
else
      echo "docker've already installed in this computer"
fi

if [ -z "$(dpkg -l | grep -E '^ii' | grep docker-compose)" ]
then
      sudo apt install -y docker-compose
else
      echo "docker-compose've already installed in this computer"
fi

if [ -z "$(ps aux | grep "docker" | grep -v "grep")" ]
then
      sudo systemctl enable docker.service
      sudo systemctl restart docker.service
else
      echo "docker.service've already running in this computer"
fi

if [ -z "$(ps aux | grep "containerd" | grep -v "grep")" ]
then
      sudo systemctl enable containerd.service
      sudo systemctl restart containerd.service
else
      echo "containerd.service've already running in this computer"
fi

# Download datastack from https://drive.google.com/drive/u/0/folders/17i0jINA19m9PZ1u292Tht5lm5sZIWhcm
wget --load-cookies ~/Downloads/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies ~/Downloads/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1tJJiMOaYtmzSskWq1EGgCOmR6J3VZFqs' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1tJJiMOaYtmzSskWq1EGgCOmR6J3VZFqs" -O ~/Downloads/datastack.tar.gz && rm ~/Downloads/cookies.txt

# Unzip datastack.tar.gz
cd ~/Downloads && tar -xvf datastack.tar.gz && git clone https://gitlab.com/ultorex/skipid/backend/dbs.git ~/Documents/dbs && rsync -a ~/Downloads/DataStack/ ~/Documents/dbs/

# Run docker-compose and save logs to ~/Documents/dbs/docker.log

docker-compose -f ~/Documents/dbs/docker-compose.yml up > ~/Documents/dbs/docker.log 2>&1 &

tail -f ~/Documents/dbs/docker.log &

# Cleaning up

sudo apt autoremove; 
rm -rf ~/Downloads/DataStack ~/Downloads/datastack.tar.gz 
