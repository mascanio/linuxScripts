#!/bin/bash  

FILE=$1 

sudo mkdir -p /usr/local/java

sudo cp -r $FILE /usr/local/java
cd /usr/local/java

sudo tar xvzf $FILE
sudo rm -f $FILE
JAVA="$(ls | grep jdk)"
echo "$JAVA"

sudo echo "JAVA_HOME=/usr/local/java/$JAVA" >> ~/.profile
sudo echo 'PATH=$PATH:$HOME/bin:$JAVA_HOME/bin' >> ~/.profile
sudo echo 'export JAVA_HOME' >> ~/.profile
sudo echo 'export PATH' >> ~/.profile

JAVA_HOME=/usr/local/java/$JAVA 
echo "Java home: $JAVA_HOME"

sudo update-alternatives --install "/usr/bin/java" "java" "$JAVA_HOME/bin/java" 1 
sudo update-alternatives --install "/usr/bin/javac" "javac" "$JAVA_HOME/bin/javac" 1 
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "$JAVA_HOME/bin/javaws" 1

sudo update-alternatives --set java $JAVA_HOME/bin/java
sudo update-alternatives --set javac $JAVA_HOME/bin/javac 
sudo update-alternatives --set javaws $JAVA_HOME/bin/javaws


