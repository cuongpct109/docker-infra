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

# Check and remove relevant containers if needed
# getContainerID <CONTAINER-NAME> <PORT>. Ex: getContainerID redis 6379
# removeContainer <CONTAINER-ID>. Ex: removeContainer $(getContainerID redis 6379)

getContainerID () {
      if [ -z $( docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a| tail -n+2 | grep $1 | 
                if [ -z "$2" ]
                then awk '{ print $1 }'
                else grep -w "$2" | awk '{ print $1 }'
                fi
                ) ]
      then 
            docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a| tail -n+2 | grep $1 | 
                if [ -z "$2" ]
                then awk '{ print $1 }'
                else grep -w "$2" | awk '{ print $1 }'
                fi
      else 
            docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a| tail -n+2 | grep $1 |  awk '{ print $1 }'
    fi
}


removeContainer () {                                                             
      export containerID=$1
      if [ -z "$containerID" ]
      then
            :
      else
            sudo docker stop "$containerID" > /dev/null
            sudo docker rm "$containerID"
      fi
}

removeContainer $(getContainerID redis 6379)                                     
removeContainer $(getContainerID mysql 3306)
removeContainer $(getContainerID mongo 27017)



# Check and remove relevant images if needed
# getImageID <REPOSITORY-NAME> <TAG>. Ex: getImageID redis latest
# removeImage <IMAGE-ID>. Ex: removeImage $(getImageID redis latest)

getImageID () {
      docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"| tail -n+2 | grep $1 | 
                if [ -z "$2" ]
                then awk '{ print $1 }'
                else grep -w "$2" | awk '{ print $1 }'
                fi
}

removeImage () {                                                             
      export imageID=$1
      if [ -z "$imageID" ]
      then
            :
      else
            sudo docker rmi "$imageID"
      fi
}

removeImage $(getImageID redis latest)                                     
removeImage $(getImageID mysql 5.7)
removeImage $(getImageID mongo 4.4)

if [ -d ~/Documents/skipid ]    
then
    rm -rf ~/Documents/skipid
    echo "~/Documents/skipid removed"
else
    :
fi

if [ -d ~/Documents/dbs ]    
then
    rm -rf ~/Documents/dbs
    echo "~/Documents/dbs removed"
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

if [ -d ~/java1.8-272 ]    
then
    rm -rf ~/java1.8-272
    echo "~/java1.8-272 removed"
else
    :
fi

if [ -f ~/Documents/utilities/.env ]
then
    rm -rf ~/Documents/utilities/.env
    echo "~/Documents/utilities/.env removed"
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


if [ -f ~/openlogic-openjdk-8u272-b10-linux-x64.tar.gz ]
then
    rm -rf ~/openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
    echo "~/apache-ant-1.9.16-bin.zip removed"
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
    rm -rf ~/Downloads/datastack.tar.gz*
    echo "~/Downloads/datastack.tar.gz removed"
else 
    :
fi


if [ -f ~/Downloads/cookies.txt ]
then
    rm ~/Downloads/cookies.txt
    echo "~/Downloads/cookies.txt removed"
else 
    :
fi
