#!/bin/sh

################################# LICENSE #############################################
#                                                                                     #
#	'make_backup_simple.sh' shell script to make backup of the direcory using rsync.  #
#    Copyright (C) 2022  Dmitry Kuznetsov aka dkx86                                   #
#                                                                                     #
#    This program is free software: you can redistribute it and/or modify             #
#    it under the terms of the GNU General Public License as published by             #
#    the Free Software Foundation, either version 3 of the License, or                #
#    (at your option) any later version.                                              #
#                                                                                     #
#    This program is distributed in the hope that it will be useful,                  #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of                   #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                    #
#    GNU General Public License for more details.                                     #
#                                                                                     #
#    You should have received a copy of the GNU General Public License                #
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.           #
#                                                                                     #
################################# EXAMPLE #############################################
#                                                                                     #
# 1. ./make_backup_simple.sh                                                          #
#	 This will backup 'SOURCE_DIR_PATH' to 'BACKUP_ROOTDIR_PATH'                      #
#                                                                                     #
# 2. ./make_backup.sh --del                                                           #
# 	 This will delete from 'BACKUP_ROOTDIR_PATH' all files, deleted                   #
#	 in 'SOURCE_DIR_PATH' direcoty.                                                   #
#                                                                                     #
#######################################################################################

# path to direcory we want to backup
SOURCE_DIR_PATH='</set/path/to/source/directory/here>'

#path to direcory with all backups
BACKUP_ROOTDIR_PATH='</set/path/to/destination/directory/here>'

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


if [ "$1" = "--del" ]
	then 
		delete_files 
	else
		update_files 
		find_deleted_files 
fi







