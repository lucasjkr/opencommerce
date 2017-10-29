# OpenCommerce

## working namd!

OpenCommerce's goal is to be a robust, scalable PLATFORM for deploying online stores. It is based off of a popular 
opensource system currently, but will be making its own path. The eventual goal will be a turnkey system that can scale 
from running on a single server, to running in a set of docker containers on the same server, to running across a series 
of containers spread across different boxes.


## Progress Report - Tasks Completed

- Converted database to use InnoDB tables exclusively to allow concurrent writes

- Added timestamps columns (added, modified) to all tables

- Moved `/system/` directory outside of the public accessible path

- Merged the model directories into a single respository in `/common/model`

- Removed web-installer, updated CLI installer

- Administrative users are identified by email address, not user name

- Fixed issue where columns with DATE type had invalid default values. which could cause issues for developers attempting 
to modify the base tables.


## In process

- Remove OC's native mail function and replacing with a wrapper around PHPMailer (Complete) 
    - Needs more testing
    - Controllers neeed to be re-written to use the new wrapper.

- Converting queries to parameterized queries, which will clean up a LOT of messiness `($this->db->escape((int)$value)`

- Merging Admin and Catalog models into a single Model where applicable

- Merge User and Customer tables - only table to check for logins, lists, etc



## Coming up soon

- Drop the old Mail implementation, and use PHPMailer instead

- Drop the old CURL requests and implement Guzzle



## Requirements

- Ubuntu server
- Apache 2.4 with mod_rewrite
- PHP 7.0
- MySQL 5.7
- PDO extension
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