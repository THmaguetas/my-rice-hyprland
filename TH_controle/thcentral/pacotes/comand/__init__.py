from pacotes.cores import cor
import os 

def cmd_main(usr=os.getlogin()):
    cmd = input(cor.ciano + f'{usr}@thCentral' + cor.magenta +  '|≻ ' + cor.default).lower()
    return cmd
