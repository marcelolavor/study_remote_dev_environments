#!/bin/bash

# Instalação do Python 3.12 via UV com integração Conda
# Ubuntu 22.04 LTS

echo "🔧 Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

echo "📦 Instalando dependências básicas..."
sudo apt install -y curl build-essential pkg-config libssl-dev

echo "🚀 Instalando UV..."
curl -LsSf https://astral.sh/uv/install.sh | sh

# Recarrega perfil para ter o uv no PATH
source ~/.profile

echo "📦 Instalando Python 3.12 via UV..."
uv python install 3.12

echo "🔁 Atualizando .bashrc para usar Python 3.12 como default..."
UV_PY_PATH="$HOME/.local/share/uv/python/cpython-3.12.11-linux-x86_64-gnu/bin"

# Adiciona ao final do ~/.bashrc se ainda não estiver presente
if ! grep -Fxq "$UV_PY_PATH" ~/.bashrc; then
  echo -e "\n# Prioriza Python 3.12 instalado via UV" >> ~/.bashrc
  echo "export PATH=\"$UV_PY_PATH:\$PATH\"" >> ~/.bashrc
fi

echo "🔁 Aplicando novo PATH..."
export PATH="$UV_PY_PATH:$PATH"

echo "⚙️ Configurando Conda para usar Python 3.12 como padrão..."
conda config --set default_python 3.12

echo "✅ Verificações finais:"
echo -n "python → "; python --version
echo -n "python3 → "; python3 --version
echo -n "conda  → "; conda --version

echo "✅ Instalação concluída. Reinicie o terminal ou execute: source ~/.bashrc"
