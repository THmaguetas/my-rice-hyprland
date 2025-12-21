sudo mount /dev/sdb /media/projs_Ti

sudo mount /dev/sdc /media/arquivos

sudo mount -o uid=$(id -u),gid=$(id -g),umask=022 /dev/sdd1 /media/dados
