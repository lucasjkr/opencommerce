# OpenCommerce

## working name!

OpenCommerce's goal is to be a robust, scalable PLATFORM for deploying online stores. It is based off of a popular 
opensource system currently, but will be making its own path. The eventual goal will be a turnkey system that can scale 
from running on a single server, to running in a set of docker containers on the same server, to running across a series 
of containers spread across different boxes.

## Progress Report - Tasks Completed

#### Database Updates
- Converted database to use InnoDB tables exclusively to allow concurrent writes
- Added timestamps columns (added, modified) to all tables
- Fixed issue where columns with DATE type had invalid default values. which could cause issues for developers attempting 
to modify the base tables.
- Database is based on Opencart 3.0 database, but installation is as a series of Phinx migrations, which apply that database, 
then make changes subsequent to that.

#### File Organization
- Moved `/system/` directory outside of the public accessible path
- Merged the model directories into a single respository in `/common/model`
- Removed web-installer, updated CLI installer
- Administrative users are identified by email address, not user name

#### Other Changes
- OpenCart's Mail class has been rewritten to function as a wrapper for PHPMailer.

## In process
- Converting queries to parameterized queries, which will clean up a LOT of messiness `($this->db->escape((int)$value)`
- Merging Admin and Catalog models into a single Model where applicable
- Merge User and Customer tables - only table to check for logins, lists, etc


## Coming up soon
- Drop the old CURL requests and implement Guzzle


## Requirements
- Ubuntu server
- Apache 2.4 with mod_rewrite
- PHP 7.0
- MySQL 5.7
- PDO Extension
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

Update `/config/config.php` with your SMTP Server credentials (if you want to send outgoing emails).
      
      
Log into your stores admin to continue setting it up:

     https://your-site.com/admin/
     
 ## Developer Notes
 
 ####
 Phinx Usage
 Now using Rob Morgan's [Phinx](https://phinx.org) for database migrations
  
 To run new migrations, go to home directory and execute:
 `vendor/bin/phinx migrate`
 
 ####
 Phinx Generator
 Also using Daniel Opitz's [Phinx Migrations Generator](https://github.com/odan/phinx-migrations-generator)
 
 To get the current state of the database structure, execute the following:
 `vendor/bin/phinx-migrations generate`
 
 It will ask for a name, and that migration will serve as a "checkpoint". Importantly, add THAT migration to your `.gitignore`
 
 Thereafter, you can make changes directly to the database structure, and just need to re-run the generator to create a new migration to commit:
 `vendor/bin/phinx-migrations generate`. It's not perfect - I recommend you edit the existing migration and delete the data that isn't needed.