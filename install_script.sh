#!/bin/bash
set -e

diret_atual="$(cd "$(dirname "$0")" && pwd)"
diret_rice="$HOME/.config/Hypr_rice-th"
diret_conf="$HOME/.config"
bkp_old_rice="$HOME/.bkp-old-config"


link_simb() {
    local dir_rice="$1"
    local destino="$2"
    local nome_old_arq
    nome_old_arq="$(basename "$destino")"

    if [ -d "$destino" ] && [ ! -L "$destino" ]; then   # "-d": diretório existe ou não | "-L": é um link simbólico ou não
        echo "|≻  backup de $nome_old_arq foi feito em: $bkp_old_rice"
        cp -a "$destino" "$bkp_old_rice/${nome_old_arq}-$(date +%s%N)"
        rm -rf "$destino"
    fi

    ln -sfn "$dir_rice" "$destino"
}


echo "|≻  PREPARANDO A INSTALAÇÃO DO RICE"


if [ "$diret_atual" != "$diret_rice" ]; then
    echo "|≻  mova a pasta 'Hypr_rice-th' para $HOME/.config"
    exit 1
fi
echo "|≻  OK"

echo "|≻  criando diretórios"
mkdir -p "$bkp_old_rice" # pasta de backup da config antiga (se tiver)
mkdir -p "$HOME/.local/share/fastfetch"
mkdir -p "$HOME/.themes/nemotheme"
mkdir -p "$HOME/.local/share/icons"
echo "|≻  OK"

echo "|≻  criando links simbólicos"
link_simb "$diret_rice/gtk-3.0"           "$diret_conf/gtk-3.0"

link_simb "$diret_rice/gtk-4.0"           "$diret_conf/gtk-4.0"

link_simb "$diret_rice/hypr"              "$diret_conf/hypr"

link_simb "$diret_rice/kitty"             "$diret_conf/kitty"

link_simb "$diret_rice/mako"              "$diret_conf/mako"

link_simb "$diret_rice/themes"            "$diret_conf/themes"

link_simb "$diret_rice/waybar"            "$diret_conf/waybar"

link_simb "$diret_rice/wofi"              "$diret_conf/wofi"

link_simb "$diret_rice/fastfetch"         "$diret_conf/fastfetch"
link_simb "$diret_rice/fastfetch/presets" "$HOME/.local/share/fastfetch/presets"

link_simb "$diret_rice/nemo"              "$diret_conf/nemo"
link_simb "$diret_conf/nemo/gtk-3.0"      "$HOME/.themes/nemotheme/gtk-3.0"
echo "|≻  OK"

echo "|≻  baixando Chicago95 theme"
if [ ! -d "$HOME/.local/share/icons/Chicago95" ]; then
    git clone https://github.com/grassmunk/Chicago95.git /tmp/Chicago95
    mv /tmp/Chicago95 "$HOME/.local/share/icons/"
else
    echo "|≻  Chicago95 já foi instalado"
fi
echo "|≻  OK"

echo "|≻  INSTALAÇÃO FINALIZADA! use sem moderação"
