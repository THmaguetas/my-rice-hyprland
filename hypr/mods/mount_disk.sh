#!/bin/bash
/bin/mount /dev/sdb /media/projs_Ti
/bin/mount /dev/sdc /media/arquivos
/bin/mount -o uid=$(id -u),gid=$(id -g),fmask=0000,dmask=0000 /dev/sdd1 /media/dados
