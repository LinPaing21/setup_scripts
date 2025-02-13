#!/bin/bash

# Function to print messages in blue
print_blue() {
    echo -e "\033[34m$1\033[0m"
}

# Install Curl
sudo apt install -y curl

print_blue "PHP Installation Started"
# PHP Installation (multiple versions)
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update

# Install PHP 7.0 to 8.4 versions
for version in 7.0 7.1 7.2 7.3 7.4 8.0 8.1 8.2 8.3
do
  sudo apt install -y php${version} php${version}-cli php${version}-common php${version}-fpm php${version}-mbstring php${version}-xml php${version}-curl php${version}-zip php${version}-mysql
done
print_blue "PHP Installation Done"

print_blue "Composer Installation Started"
# Composer Installation
sudo apt update
sudo apt install -y curl php-cli php-mbstring unzip
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer --version
print_blue "Composer Installation Done"

print_blue "Apache2 Installation Started"
# Apache2 Installation
sudo apt update
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2 --no-pager
print_blue "Apache2 Installation Done"


# MySQL Installation
print_blue "MySQL Installation Started"
sudo apt update
sudo apt install -y mysql-server
sudo systemctl enable mysql
sudo systemctl start mysql
sudo systemctl status mysql --no-pager
print_blue "MySQL Installation Done"

print_blue "Git Installation Started"
# Git Installation
sudo apt update
sudo apt install -y git
git --version
print_blue "Git Installation Done"

print_blue "Mongo Installation Started"
# MongoDB Installation
sudo apt-get install gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu $(grep UBUNTU_CODENAME /etc/os-release | cut -d'=' -f2)/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod --no-pager

# Enable MongoDB Replication
sudo sed -i '/^#replication:/a replication:\n  replSetName: "rs0"' /etc/mongod.conf
sudo sed -i 's/^  bindIp: .*$/  bindIp: 0.0.0.0/' /etc/mongod.conf
sudo systemctl restart mongod
print_blue "MongoDB Installation Done"

print_blue "IDE and Postman Installation Started"
# VSCode, Android Studio, and Postman Installation
sudo apt update
sudo apt install snapd -y
sudo snap install code --classic
sudo snap install android-studio --classic
sudo snap install postman
print_blue "IDE and Postman Installation Done"

print_blue "Dart & Flutter Installation Started"
# Dart & Flutter Installation
sudo apt-get update -y && sudo apt-get upgrade -y;
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
sudo apt-get install -y libc6:amd64 libstdc++6:amd64 lib32z1 libbz2-1.0:amd64

mkdir -p ~/development
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.4-stable.tar.xz
tar -xf flutter_linux_3.27.4-stable.tar.xz -C ~/development/

echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.profile
source ~/.profile

flutter doctor --android-licenses

echo -e '\n# Android SDK Path\nexport ANDROID_SDK_ROOT=~/Android/Sdk\nexport ANDROID_HOME=~/Android/Sdk\n\n# Add Android SDK tools to PATH\nexport PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH\n\n# Add Gradle if installed via SDK\nexport PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/cmdline-tools/gradle/bin:$PATH' >> ~/.profile
source ~/.profile

echo "ANDROID_SDK_ROOT: $ANDROID_SDK_ROOT"
echo "PATH: $PATH"

flutter doctor
print_blue "Dart & Flutter Installation Done"

print_blue "NVM & NPM Installation Started"
# NVM & NPM Installation
sudo apt update
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source ~/.bashrc
print_blue "NVM & NPM Installation Done"

print_blue "Java(multiple versions) Installation Started"
# Java Installation (multiple versions)
sudo apt update
sudo apt install -y openjdk-8-jdk openjdk-11-jdk openjdk-17-jdk openjdk-21-jdk

# Register Java versions with update-alternatives
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-openjdk-amd64/bin/java 1
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-11-openjdk-amd64/bin/java 2
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-17-openjdk-amd64/bin/java 3
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-21-openjdk-amd64/bin/java 4

sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac 2
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-17-openjdk-amd64/bin/javac 3
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-21-openjdk-amd64/bin/javac 4
print_blue "Java(multiple versions) Installation Done"
