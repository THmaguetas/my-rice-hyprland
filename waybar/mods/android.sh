#!/bin/bash

# Checa se o container já está ativo
if ! systemctl --user is-active --quiet waydroid-container; then
    systemctl --user start waydroid-container
    # espera um pouco para garantir que o container esteja pronto
    sleep 3
fi

# Abre interface do Waydroid se não houver janela aberta
if ! pgrep -x "waydroid" > /dev/null; then
    waydroid show-full-ui &
fi
