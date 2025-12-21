import os
import subprocess
from pacotes.comand import *
from pacotes.ajuda import *
from pacotes.logo import *

logo()
# LEMBRETE: MUDAR OS DIRETÓRIOS 

while True:
    comando = cmd_main()

    if comando == "ajuda":
        ajuda()

    elif comando == "mount":
        os.system("bash /home/th/.config/Hypr_rice-th/TH_controle/thcentral/programas/mount.sh")

    elif comando == "umount":
        os.system("bash /home/th/.config/Hypr_rice-th/TH_controle/thcentral/programas/umount.sh")

    elif comando == "bkp-arq":
        os.system("bash /home/th/.config/Hypr_rice-th/TH_controle/thcentral/programas/backup_arquivos.sh")

    elif comando == "bkp-conf":
        os.system("bash /home/th/.config/Hypr_rice-th/TH_controle/thcentral/programas/backup_configs.sh")

    elif comando == "bkp-mine":
        os.system("bash /home/th/.config/Hypr_rice-th/TH_controle/thcentral/programas/bkpmine.sh")

    elif comando == "upd_all":
        os.system("bash /home/th/.config/Hypr_rice-th/TH_controle/thcentral/programas/upd_all.sh")

    elif comando == "clear_sys":
        subprocess.run(
            ["sudo", "/home/th/.config/Hypr_rice-th/TH_controle/thcentral/programas/clear_sys.sh"],
            check=True
        )
    
    elif comando == "rice":
        os.system("bash /home/th/.config/Hypr_rice-th/TH_controle/thcentral/programas/rice.sh")
        break


    elif comando == 'sair':
        print(cor.amarelo + 'encerrando hub...' + cor.default)
        break
    else:
        print(cor.vermelho + ' ERRO: nenhum comando correspondente.')
        print('       digite ' + cor.amarelo + 'ajuda ' + cor.default)
