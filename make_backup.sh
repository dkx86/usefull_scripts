#!/bin/sh

################################# LICENSE #########################################
#                                                                                 #
#	'make_backup.sh' shell script to make backup of the direcory using rsync.     #
#    Copyright (C) 2022  Dmitry Kuznetsov aka dkx86                               #
#                                                                                 #
#    This program is free software: you can redistribute it and/or modify         #
#    it under the terms of the GNU General Public License as published by         #
#    the Free Software Foundation, either version 3 of the License, or            #
#    (at your option) any later version.                                          #
#                                                                                 #
#    This program is distributed in the hope that it will be useful,              #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of               #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                #
#    GNU General Public License for more details.                                 #
#                                                                                 #
#    You should have received a copy of the GNU General Public License            #
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.       #
#                                                                                 #
################################# EXAMPLE #########################################
#                                                                                 #
# 1. ./make_backup.sh /mnt/d/test_soure /mnt/d/test_backup_root/                  #
#	 This will backup 'test_soure' to '/mnt/d/test_backup_root/test_soure'        #
#                                                                                 #
# 2. ./make_backup.sh /mnt/d/test_soure /mnt/d/test_backup_root --del             #
# 	 This will delete from '/mnt/d/test_backup_root/test_soure' all files,        #
#	 deleted in '/mnt/d/test_soure' direcoty.                                     #
#                                                                                 #
###################################################################################

# path to direcory we want to backup
SOURCE_DIR_PATH=$1

#path to direcory with all backups
BACKUP_ROOTDIR_PATH=$2

update_files() {
	echo "\n -------------------- Processing '$SOURCE_DIR_PATH' directory --------------------"
	rsync -av $SOURCE_DIR_PATH $BACKUP_ROOTDIR_PATH
}

find_deleted_files() {
	echo "\n --------------------------- Finding deleted files ----------------------------------"
	rsync -avn --del $SOURCE_DIR_PATH $BACKUP_ROOTDIR_PATH 
}

delete_files() {
	echo "\n --------------------------- !!! DELETING FILES !!! ---------------------------------"
	rsync -av --del $SOURCE_DIR_PATH $BACKUP_ROOTDIR_PATH 
}

if [ -z "$1" ]
  then 
	echo "No argument for source direcory path supplied!"
	exit 1	
fi

if [ -z "$2" ]
  then 
	echo "No argument for backup root direcory path supplied!"
	exit 1	
fi

if [ "$3" = "--del" ]
	then 
		delete_files 
	else
		update_files 
		find_deleted_files 
fi







