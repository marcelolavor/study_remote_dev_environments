#!/usr/bin/env bash

# Verifica se está sendo executado como root
if [[ "$EUID" -ne 0 ]]; then
  echo "Este script precisa ser executado como root." >&2
  exit 1
fi

# Determina o usuário a ser adicionado:
# Prioriza SUDO_USER (se chamado via sudo), depois logname
TARGET_USER="${SUDO_USER:-$(logname 2>/dev/null)}"

# Verifica se o usuário existe
if ! id "$TARGET_USER" &>/dev/null; then
  echo "Usuário '$TARGET_USER' não encontrado." >&2
  exit 1
fi

# Adiciona ao grupo sudo
usermod -aG sudo "$TARGET_USER"

echo "Usuário '$TARGET_USER' adicionado ao grupo sudo com sucesso."