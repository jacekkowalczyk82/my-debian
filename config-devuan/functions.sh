#!/bin/bash 

install_custom_packages() { 
for package_line in $(< /packages.list); do 
    package_name=$(echo $package_line | grep -v \# | xargs -n 1 ) 
    if [ ! -z $package_name ]; then 
		apt-get -y install $package_name 
    fi 
done 
}
