#!/bin/bash

# Create .env file in ~/Documents/utilities/ folder

eval "$(curl https://raw.githubusercontent.com/cuongpct109/skipid-infra/main/env-config.sh)"

# Killing port 3000, port 8080 and delete necessary folders

eval "$(curl https://raw.githubusercontent.com/cuongpct109/skipid-infra/main/prepare-port-folder.sh)"

# Update

sudo apt update;

# Installing apache-tomcat-8.0.53, apache-ant-1.9.16 and java1.8-272

eval "$(curl https://raw.githubusercontent.com/cuongpct109/skipid-infra/main/install-tomcat-ant-java.sh)"

# Clone common and kyc-api source

mkdir ~/Documents/skipid 
cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/backend/common.git && git clone https://gitlab.com/ultorex/skipid/backend/kyc-api.git 

# Build kyc-api with gradlew then move file war into webapps folder of tomcat-8.0.53

cd ~/Documents/skipid/kyc-api && ./gradlew build && cd ~/Documents/skipid/kyc-api/build/libs && mv kyc-api-0.0.1-SNAPSHOT.war ~/apache-tomcat-8.0.53/webapps/ && mv ~/apache-tomcat-8.0.53/webapps/kyc-api-0.0.1-SNAPSHOT.war ~/apache-tomcat-8.0.53/webapps/kyc-api.war

# Clone kyc-admin source

cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/backend/kyc-admin.git 


# Build kyc-admin with ant then move war file to webapps folder of tomcat-8.0.53

cd ~/Documents/skipid/kyc-admin && ~/apache-ant-1.9.16/bin/ant && cd ~/Documents/skipid/kyc-admin/dist && mv hibtc-back.war ~/apache-tomcat-8.0.53/webapps/

# Clone skipid frontend and copy .env (previously add to ~/Documents/utilities folder) to skipid frontend base folder 

cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/frontend/skipid.git && cd ~/Documents/skipid/skipid && touch .env && cp /home/cuong/Documents/utilities/.env ~/Documents/skipid/skipid/

# Install skipid frontend with yarn

sudo chmod -R 777 ~/Documents/skipid/skipid/node_modules
cd ~/Documents/skipid/skipid
yarn install
yarn global add serve

# Start tomcat server at port 8080

~/apache-tomcat-8.0.53/bin/startup.sh

# Start skipid frontend server at port 3000

cd ~/Documents/skipid/skipid 
yarn build
serve -s build -p 3000 &

# Remove .env file in the utilities folder

rm -rf ~/Documents/utilities/.env
