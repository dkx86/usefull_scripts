# USEFULL SCRIPTS

**[RU]** 

Различные полезные скрипты, который я написал для себя, что бы облегчить себе жизнь. 

## make_backup.sh

**make_backup.sh** - консольный скрипт для бэкапа файлов с использованием утилиты _rsync_.

Аргументы:
* `--fdel` - поиск файлов подпадающих под удаление из резервной копии.
* `--del`  - удаление из резервной копии, удалённых в источнике файлов.

При запуске без аргументов происходит только копирование новых и обновлённых файлов и директорий.

Перед использованием нужно задать переменные путей в самом скрипте.

* `SOURCE_ROOT_PATH` - путь к директории-источнику.
* `BACKUP_ROOT_PATH` - путь к директории-назначению.
* `DIRS` - массив с именами директорий в `SOURCE_ROOT_PATH`, которые необходимо обрабатывать.

---

**[EN]** 

Various useful scripts that I wrote to make my life easier. 

## make_backup.sh

**make_backup.sh** - shell script to make backup of the direcory using rsync.

Arguments:
* `--fdel` - find files that should be deleted from the backup.
* `--del`  - delete from the backup files, that was removed from the source.

Runing the script without arguments will process only copying new and updated files.

Before use set up these varaible in the script:

* `SOURCE_ROOT_PATH` - path to directory we want to backup from.
* `BACKUP_ROOT_PATH` - path to directory we want to back up to.
* `DIRS` - selected directories into `SOURCE_ROOT_PATH`, that we want to backup.
