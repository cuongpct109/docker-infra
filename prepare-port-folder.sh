#!/bin/bash

# Kill processes which using 3000 port

port_3000=$(lsof -i:3000 | awk '{print $2}' | uniq | tail -n+2)
if [ -z $port_3000 ]             
then
    echo "nothing is running on port 3000"
    echo "==============================="
else
    for i in $(echo $port_3000 | sed "s/,/ /g")  
    do
        kill -9 $i > /dev/null
        echo "killing process (ID=$i) with port 3000"
        echo "==============================="
    done
fi


# Kill processes which using 8080 port

port_8080=$(lsof -i:8080 | awk '{print $2}' | uniq | tail -n+2)
if [ -z $port_8080 ]             
then
    echo "nothing is running on port 8080"
    echo "==============================="
else
    for i in $(echo $port_8080 | sed "s/,/ /g")  
    do
        kill -9 $i > /dev/null
        echo "killing process (ID=$i) with port 8080"
        echo "==============================="
    done
fi

if [ -d ~/Documents/skipid ]    
then
    rm -rf ~/Documents/skipid
    echo "~/Documents/skipid removed"
else
    :
fi

if [ -d ~/apache-tomcat-8.0.53 ]    
then
    rm -rf ~/apache-tomcat-8.0.53
    echo "~/apache-tomcat-8.0.53 removed"
else
    :
fi

if [ -d ~/apache-ant-1.9.16 ]    
then
    rm -rf ~/apache-ant-1.9.16
    echo "~/apache-ant-1.9.16 removed"
else
    :
fi

if [ -f ~/apache-tomcat-8.0.53.zip ]
then
    rm -rf ~/apache-tomcat-8.0.53.zip*
    echo "~/apache-tomcat-8.0.53.zip removed"
else 
    :
fi

if [ -f ~/apache-ant-1.9.16-bin.zip ]
then
    rm -rf ~/apache-ant-1.9.16-bin.zip*
    echo "~/apache-ant-1.9.16-bin.zip removed"
else 
    :
fi
