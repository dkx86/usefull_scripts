#!/bin/bash

################################# LICENSE #####################################
#                                                                                 
#	"make_backup.sh" is a shell script to make backup 
#	 of the selected directory using rsync.
#
#	version 2.0
#
#	Copyright (c) 2022 Dmitry Kuznetsov aka dkx86. All rights reserved.
#
#	Redistribution and use in source and binary forms, with or without
#	modification, are permitted provided that the following conditions are
#	met:
#
#	1. Redistributions of source code must retain the above copyright
#	notice, this list of conditions and the following disclaimer.
#	2. Redistributions in binary form must reproduce the above
#	copyright notice, this list of conditions and the following disclaimer
#	in the documentation and/or other materials provided with the
#	distribution.
#
#	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#	A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#	OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#	SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
#	LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
###############################################################################

# ROOT path to directory we want to backup from
SOURCE_ROOT_PATH='</path/to/source/directory>'

# Selected directories we want to backup
DIRS=("dir name 1" "dir name 2")

# ROOT path to directory we want to back up to
BACKUP_ROOT_PATH='</path/to/destination/directory>'

update_files() {
	arr=("$@")
	for DIR in "${arr[@]}"
	do
		echo "-------------------- Processing '$SOURCE_ROOT_PATH/$DIR' directory --------------------"
		rsync -av "$SOURCE_ROOT_PATH/$DIR" $BACKUP_ROOT_PATH
	done
}

find_deleted_files() {
	arr=("$@")
	for DIR in "${arr[@]}"
	do
		echo "--------------------------- Finding deleted files in $BACKUP_ROOT_PATH for '$SOURCE_ROOT_PATH/$DIR'----------------------------------"
		rsync -avn --del "$SOURCE_ROOT_PATH/$DIR" $BACKUP_ROOT_PATH
	done
}

delete_files() {
	arr=("$@")
	for DIR in "${arr[@]}"
	do
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!! --- DELETING FILES in $BACKUP_ROOT_PATH for '$SOURCE_ROOT_PATH/$DIR' --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		rsync -av --del "$SOURCE_ROOT_PATH/$DIR" $BACKUP_ROOT_PATH
	done
}


if [ "$1" = "--del" ]
	then 
		delete_files "${DIRS[@]}"
	elif [ "$1" = "--fdel" ]
	then
		find_deleted_files "${DIRS[@]}"
	else
		update_files "${DIRS[@]}"
fi
