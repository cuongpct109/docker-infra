#!/bin/bash

# Download apache-tomcat-8.0.53 and apache-ant-1.9.16

cd ~ && wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.zip && unzip -o apache-tomcat-8.0.53.zip && rm apache-tomcat-8.0.53.zip && chmod +x ~/apache-tomcat-8.0.53/bin/catalina.sh ~/apache-tomcat-8.0.53/bin/startup.sh ~/apache-tomcat-8.0.53/bin/shutdown.sh
cd ~ && wget https://dlcdn.apache.org//ant/binaries/apache-ant-1.9.16-bin.zip && unzip -o apache-ant-1.9.16-bin.zip && rm apache-ant-1.9.16-bin.zip && chmod +x ~/apache-ant-1.9.16/bin/ant ~/apache-ant-1.9.16/bin/antRun

# Check current shell and configure JAVA if needed

if [ "$(echo $0)" = "bash" ] || [ "$(echo $0)" = "/bin/bash" ]; then
    if [ -d ~/java1.8-272 ] 
    then
        rm -rf ~/java1.8-272
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272
        if [ -z "$(grep -e ':$JAVA_HOME/bin' ~/.bashrc | grep -w "export" | grep -w "PATH")" ] && [ -z "$(grep -e 'JAVA_HOME=' ~/.bashrc | grep -w "export")" ];
        then 
            echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc
        else
            :
        fi
        source ~/.bashrc
    else
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz* 
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272
        if [ -z "$(grep -e ':$JAVA_HOME/bin' ~/.bashrc | grep -w "export" | grep -w "PATH")" ] && [ -z "$(grep -e 'JAVA_HOME=' ~/.bashrc | grep -w "export")" ];
        then 
            echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc
        else
            :
        fi
        source ~/.bashrc
    fi
fi

if [ "$(echo $0)" = "sh" ] || [ "$(echo $0)" = "/bin/sh" ]; then
    if [ -d ~/java1.8-272 ] 
    then
        rm -rf ~/java1.8-272
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272 
        if [ -z "$(grep -e ':$JAVA_HOME/bin' ~/.bashrc | grep -w "export" | grep -w "PATH")" ] && [ -z "$(grep -e 'JAVA_HOME=' ~/.bashrc | grep -w "export")" ];
        then 
            echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc
        else
            :
        fi 
        source ~/.bashrc
    else
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272
        if [ -z "$(grep -e ':$JAVA_HOME/bin' ~/.bashrc | grep -w "export" | grep -w "PATH")" ] && [ -z "$(grep -e 'JAVA_HOME=' ~/.bashrc | grep -w "export")" ];
        then 
            echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc
        else
            :
        fi
        source ~/.bashrc
    fi
fi

if [ "$(echo $0)" = "zsh" ] || [ "$(echo $0)" = "/bin/zsh" ]; then
    if [ -d ~/java1.8-272 ] 
    then
        rm -rf ~/java1.8-272
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272 
        if [ -z "$(grep -e ':$JAVA_HOME/bin' ~/.zshrc | grep -w "export" | grep -w "PATH")" ] && [ -z "$(grep -e 'JAVA_HOME=' ~/.zshrc | grep -w "export")" ];
        then 
            echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.zshrc
        else
            :
        fi
        source ~/.zshrc
    else
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272
        if [ -z "$(grep -e ':$JAVA_HOME/bin' ~/.zshrc | grep -w "export" | grep -w "PATH")" ] && [ -z "$(grep -e 'JAVA_HOME=' ~/.zshrc | grep -w "export")" ];
        then 
            echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.zshrc
        else
            :
        fi
        source ~/.zshrc
    fi
fi
