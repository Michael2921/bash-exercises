#!/bin/bash

apt install openjdk-21-jre-headless -y

output=$(java -version 2>&1)
java_version=$(java -version 2>&1 | awk -F '[".]' 'NR == 1 {print $2}')

if [[ "$output" == *"command not found" ]]; then
	echo "java is not installed"
elif [[ $java_version -lt 11 ]]; then
        echo "Java is installed, but version is less than version 11"
elif [[ $java_version -gt 11 ]]; then
	echo "Java is installed, and the version is greater than version 11"
else
	echo "Java is not installed"	
fi
