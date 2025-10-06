#!/usr/bin/env bash
set -euo pipefail
set -x  # DEBUG: loga cada comando

# Trap para ver em que linha falhou
trap 'ec=$?; echo "❌ Build failed at line $LINENO with exit code $ec"; exit $ec' ERR

echo "=== ENV ==="
echo "PWD=$(pwd)"
echo "WHOAMI=$(whoami || true)"
echo "VERCEL=$VERCEL"
echo "LS ROOT:"
ls -la
echo "LS frontEnd/shift_space (sanity):"
ls -la || true

# Baixar Flutter para um diretório separado do código
FLUTTER_ROOT="$PWD/_flutter"
FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz"

echo "➡️  Baixando Flutter SDK para $FLUTTER_ROOT ..."
mkdir -p "$FLUTTER_ROOT"
curl -fLsS "$FLUTTER_URL" | tar -xJ -C "$FLUTTER_ROOT" --strip-components=1

# Git pode reclamar de 'dubious ownership'; marque tudo relacionado ao SDK como safe
git config --global --add safe.directory "$FLUTTER_ROOT" || true
git config --global --add safe.directory "$FLUTTER_ROOT/bin" || true
git config --global --add safe.directory "$FLUTTER_ROOT/bin/cache" || true
git config --global --add safe.directory "$FLUTTER_ROOT/.pub-cache" || true
# fallback agressivo para CI: (aceitável em ambiente efêmero)
git config --global --add safe.directory '*' || true

export PATH="$FLUTTER_ROOT/bin:$PATH"
export PUB_CACHE="$FLUTTER_ROOT/.pub-cache"
export FLUTTER_STORAGE_BASE_URL="https://storage.googleapis.com"
export CHROME_EXECUTABLE=""

# Sanidade de ferramentas
command -v git
command -v curl
command -v tar

echo "➡️  Versão do Flutter:"
flutter --version --suppress-analytics || true

echo "➡️  Precache/Habilitar web"
flutter config --enable-web --suppress-analytics
flutter precache --web --suppress-analytics

echo "➡️  flutter pub get"
flutter pub get

# Garanta que o projeto Flutter está mesmo aqui
echo "=== ARQUIVOS DO PROJETO ==="
ls -la .
test -f "pubspec.yaml"  # falha com exit 1 se não estiver no diretório certo

echo "➡️  Build web (release)"
flutter build web --release \
  --dart-define=API_BASE_URL="${API_BASE_URL:-https://airaware-api.onrender.com}" \
  --suppress-analytics

echo "✅ Build concluído. Saída em build/web"
