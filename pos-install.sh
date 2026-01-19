#!/bin/bash

echo "=== INICIANDO CONFIGURAÇÃO DO MANJARO ==="

# ----------------------------------------------------------------------
# PARTE 1: Instalando Apps via Flatpak
# ----------------------------------------------------------------------
echo "[1/3] Instalando Aplicativos Flatpak..."

# Internet
flatpak install flathub com.google.Chrome -y

# Desenvolvimento
flatpak install flathub com.visualstudio.code io.github.shiftey.Desktop -y

# Banco de Dados (Adicionados)
flatpak install flathub com.mongodb.Compass io.dbeaver.DBeaverCommunity -y

# Multimídia
flatpak install flathub com.spotify.Client org.videolan.VLC com.obsproject.Studio -y

# Design e Edição
flatpak install flathub org.inkscape.Inkscape org.kde.kdenlive -y

# Produtividade
flatpak install flathub com.github.xournalpp.xournalpp -y

# Jogos
flatpak install flathub com.valvesoftware.Steam -y


# ----------------------------------------------------------------------
# PARTE 2: Instalando Virtualização (KVM/QEMU/Virt-Manager)
# ----------------------------------------------------------------------
echo "[2/3] Instalando sistema de Virtualização (KVM)..."
echo "Atenção: Será necessário digitar sua senha de administrador (sudo)."

# Instala os pacotes necessários:
# virt-manager: A interface gráfica
# qemu-desktop: O emulador/virtualizador
# libvirt: O serviço que gerencia as VMs
# edk2-ovmf: Para permitir UEFI nas VMs (importante para Windows 11)
# dnsmasq: Para a rede da VM funcionar
sudo pacman -S --needed virt-manager qemu-desktop libvirt edk2-ovmf dnsmasq iptables-nft --noconfirm

# ----------------------------------------------------------------------
# PARTE 3: Configurações Finais
# ----------------------------------------------------------------------
echo "[3/3] Configurando serviços e permissões..."

# Ativa o serviço do libvirtd para iniciar com o sistema
sudo systemctl enable --now libvirtd

# Adiciona o seu usuário ao grupo do libvirt
# Isso permite abrir o Virt-Manager sem precisar de senha de root toda vez
sudo usermod -aG libvirt $USER

echo "--------------------------------------------------------"
echo "Instalação Concluída!"
echo "IMPORTANTE: Para que o Virt-Manager funcione sem senha,"
echo "você precisa REINICIAR o computador ou fazer LOGOFF agora."
echo "--------------------------------------------------------"
