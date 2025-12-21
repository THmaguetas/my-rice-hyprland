#!/bin/bash

diret_temas="$HOME/.config/Hypr_rice-th/themes"

tema=$(ls "$diret_temas" | wofi --dmenu -p "procure o tema...")

[ -z "$tema" ] && exit 0

"$HOME/.config/Hypr_rice-th/TH_controle/theme_changer.sh" "$tema"
