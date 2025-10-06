#!/usr/bin/env bash
set -euo pipefail

# Opcional: log de debug
echo "PWD=$(pwd)"
uname -a

# Escolha um diretório do SDK fora do seu código para evitar colisões
FLUTTER_ROOT="$PWD/_flutter"
FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz"

echo "➡️  Baixando Flutter SDK para $FLUTTER_ROOT ..."
mkdir -p "$FLUTTER_ROOT"
curl -L "$FLUTTER_URL" | tar -xJ -C "$FLUTTER_ROOT" --strip-components=1

# Corrige o erro 'dubious ownership' do git ao rodar flutter como root
git config --global --add safe.directory "$FLUTTER_ROOT"
# (às vezes o Flutter chama git em subpastas; por garantia)
git config --global --add safe.directory "$FLUTTER_ROOT/.pub-cache"
git config --global --add safe.directory "$FLUTTER_ROOT/bin/cache"

export PATH="$FLUTTER_ROOT/bin:$PATH"
export PUB_CACHE="$FLUTTER_ROOT/.pub-cache"
export FLUTTER_STORAGE_BASE_URL="https://storage.googleapis.com"  # padrão
export CHROME_EXECUTABLE=""  # evita tentativas de abrir Chrome no build

echo "➡️  Versão do Flutter:"
# --suppress-analytics evita prompts/telemetria
flutter --version --suppress-analytics || true

echo "➡️  Habilitando Web e preparando cache..."
flutter config --enable-web --suppress-analytics
flutter precache --web --suppress-analytics

echo "➡️  Dependencies"
flutter pub get

echo "➡️  Build web (release)"
# API_BASE_URL vem das env vars do Vercel
flutter build web --release \
  --dart-define=API_BASE_URL="${API_BASE_URL:-https://airaware-api.onrender.com}" \
  --suppress-analytics

echo "✅ Build concluído. Saída em build/web"
