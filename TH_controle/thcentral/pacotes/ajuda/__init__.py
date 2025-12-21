from pacotes.cores import cor

def ajuda():
    print(cor.amarelo + '''╔═════════════════╗
║      AJUDA      ║
╚═════════════════╝''' + cor.default)
    
    print(cor.azul + ' COMANDOS|≻' + cor.default)
    print(''' 1. mount     ->   monta discos padrões
 2. umount    ->   desmonta discos padrões
 3. bkp-arq   ->   backup dos arquivos pré setados
 4. bkp-conf  ->   backup do .config
 5. bkp-mine  ->   backup do TH survival
 6. upd_all   ->   atualiza tudo e remove pacotes não utilizados
 7. clear_sys ->   limpa o sistema
 8. hice      ->   abre as conf do hice porra''')

    print('')

    print(cor.azul + ' OUTROS|≻' + cor.default)
    print(''' 1. sair      ->   encerra o hub''')

    print('')
