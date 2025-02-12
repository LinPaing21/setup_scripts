# Ubuntu Developer Environment Setup Script

This script automates the installation and configuration of essential development tools and environments on Ubuntu-based systems. It sets up a comprehensive stack suitable for web, mobile, and software development.

## Features

- **PHP (Multiple Versions)**: Installs PHP 7.0 to 8.4 with common extensions, allowing easy version switching for legacy and modern projects.
- **Composer**: Installs Composer for PHP dependency management.
- **Apache2**: Installs and configures Apache web server.
- **MySQL**: Installs and sets up MySQL database server.
- **MongoDB**: Installs MongoDB, configures replication, and allows remote access.
- **Git**: Installs Git for version control.
- **VSCode, Android Studio, and Postman**: Installs popular development tools using Snap.
- **Dart & Flutter**: Sets up Flutter and Dart for mobile app development, with Android SDK paths configured.
- **Node.js & NPM (via NVM)**: Installs Node.js using NVM for easy version management.
- **Java (Multiple Versions)**: Installs OpenJDK 8, 11, 17, and 21 with `update-alternatives` for version switching.

## Prerequisites

Ensure you have administrative privileges (`sudo` access) to run this script.

## Installation

1. Download the bash file(.sh) to your local machine.

2. Make the script executable:

```bash
chmod +x ubuntu_developer_setup.sh
```

3. Run the script:

```bash
./ubuntu_developer_setup.sh
```

## Usage

- The script will display messages in **blue** indicating the start and completion of each installation step.
- Services like Apache2, MySQL, and MongoDB will be enabled and started automatically.
- Use `sudo update-alternatives --config php` or `sudo update-alternatives --config java` to switch between installed PHP and Java versions.

## Post-Installation

- **Verify Installations:**

  - PHP: `php -v`
  - Composer: `composer --version`
  - Apache2: `sudo systemctl status apache2`
  - MySQL: `sudo systemctl status mysql`
  - MongoDB: `mongo --eval 'rs.status()'`
  - Git: `git --version`
  - Node.js: `node -v`
  - NPM: `npm -v`
  - Java: `java -version`
  - Flutter: `flutter doctor`

- **Switching Versions:**

  - PHP: `sudo update-alternatives --config php`
  - Java: `sudo update-alternatives --config java`

## License

This project is licensed under the MIT License.

---

**Enjoy your fully set up development environment!**

