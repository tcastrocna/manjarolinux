#!/bin/bash

echo "========================================================"
echo " INICIANDO CORREÇÃO DE WI-FI INTEL (MANJARO/LINUX) "
echo "========================================================"

# 1. Configura o NetworkManager para desligar a economia de energia
# O valor '2' significa 'disable' (desativado), garantindo performance máxima.
echo "[1/3] Desativando economia de energia do Wi-Fi..."
echo -e "[connection]\nwifi.powersave = 2" | sudo tee /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf > /dev/null

# 2. Aplica a correção da Intel para estabilidade
# '11n_disable=8' ativa a agregação de pacotes de forma estável,
# resolvendo conflitos entre Wi-Fi rápido e Bluetooth.
echo "[2/3] Aplicando parâmetros do driver Intel (iwlwifi)..."
echo "options iwlwifi 11n_disable=8" | sudo tee /etc/modprobe.d/iwlwifi.conf > /dev/null

# 3. Reinicia as configurações de rede
echo "[3/3] Reiniciando serviço de rede..."
sudo systemctl restart NetworkManager

echo "========================================================"
echo " CONCLUÍDO! "
echo " A internet deve reconectar em alguns segundos."
echo " DICA: Se a velocidade não mudar imediatamente, reinicie o computador."
echo "========================================================"
