# OpenCommerce

## working namd!

OpenCommerce's goal is to be a robust, scalable PLATFORM for deploying online stores. It is based off of a popular opensource system currently, but will be making its own path.

## Requirements

- Ubuntu server
- Apache 2.4 with mod_rewrite
- PHP 7
- MySQL
- PDO 
- PHP Composer


## Installation

Clone the git repository to your server, change to that directory, and import external resources:

    composer install

Run the command line installer:
    
    php install.install.php install \
      --db_hostname 127.0.0.1 \
      --db_username database_username \
      --db_password database_password \
      --db_database opencommerce \
      --db_port 3306 \
      --username admin_username \
      --password admin_password \
      --email admin@email.com \
      
Log into your stores admin to continue setting it up:

     https://your-site.com/admin/
     
## Progress Report
Concrete tasks completed.

- Converted database to use InnoDB tables exclusively
- Added timestamps columns (added, modified) to all tables
- Fixed issue where columns with DATE type had invalid default values
- Moved `system/` directory outside of the public accessible path
- Removed web-installer, updated CLI installer
- Administrative users are identified by email address, not user name

## In process
- Merge User and Customer tables - only table to check for logins, lists, etc


### Long Term Goal

The eventual goal will be a turnkey system that can scale from running on a single server, to running in a set of docker containers on the same server, to running across a series of containers spread across different boxes.
