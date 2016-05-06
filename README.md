#####################################
#                                   #
#                                   #
#    Follow me on Github: @Aishee   #
#   __version__ == "1.2"            #
#   __author__ = "Aishee"           #
#   __email__ = "aishee@aishee.net" #
#   __website__ = "aishee.net       # 
# please, if you don not know what  #
# you are doing, DO NOT edit any-   #
# thing up. Thanks.                 # 
#####################################

#### About
ABackup is a backup script designed for Linux Server backups.

ABackup is released under GNU GPL v2. By downloading, using and editing ABackup you must agree to the terms set forth in the license provided.

---------------------------------------
#### Features 
* Web Based Administration Panel
  * Add Backup Servers
  * Add Backup Jobs
  * Add Users
  * Add ACL's
  * View Backups
  * Download Backups
  * Restore Backups
  * Session security (IP Check + inactivity timeout)
* Json Flat File Database (no MySQL database involved)
* Backups ran using cron
* Server authentication using password or RSA key
* Email notifications (sendmail / SMTP)
* Backup rotation / auto delete
* Full Backups
* Incremental Backups
* MySQL Backups
* OpenVZ Node Backups
* cPanel Account Backups
* 2-Factor Authentication (Google Authenticator)
* Backup Encryption (AES-256/GPG)
* User accounts / ACL's

---------------------------------------
#### Installation
You may use one of the following commands to install ABackup on your storage/backup server.
The backup server **has** to be running CentOS/Debian/Ubuntu, but the server(s) to be backed up may run any linux distrubution.

`/usr/bin/env bash <((wget -qO - ABackup/install.sh))`

or

`/usr/bin/env bash <((curl -sL ABackup/install.sh))`

---------------------------------------
#### System/Software Requirements
* Backup Server (the server to store all backups)
  * Minimal / Fresh OS Installation
  * Linux
  
* Host Server (the server to be backed up)
  * File
    * SSH + SFTP
    * tar
    * *99% of servers meet this requirement*
  * MySQL
    * MySQL 5
  * OpenVZ
    * SSH + SFTP
    * vzdump
    * lvm2
    * It is recommended that /vz is a logical volume
  
---------------------------------------