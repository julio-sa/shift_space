#!/usr/bin/env bash
set -euo pipefail
set -x
trap 'ec=$?; echo "❌ Build failed at line $LINENO with exit code $ec"; exit $ec' ERR

echo "PWD=$(pwd)"
ls -la

# ===== Escolha a versão do Flutter (>= 3.27.x traz Dart 3.7+) =====
FLUTTER_VERSION="${FLUTTER_VERSION:-3.27.1-stable}"
FLUTTER_ROOT="$PWD/_flutter"
FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz"

echo "➡️  Baixando Flutter $FLUTTER_VERSION para $FLUTTER_ROOT ..."
mkdir -p "$FLUTTER_ROOT"
curl -fLsS "$FLUTTER_URL" | tar -xJ -C "$FLUTTER_ROOT" --strip-components=1

# Git safe.directory p/ rodar como root no Vercel
git config --global --add safe.directory "$FLUTTER_ROOT" || true
git config --global --add safe.directory "$FLUTTER_ROOT/bin" || true
git config --global --add safe.directory "$FLUTTER_ROOT/bin/cache" || true
git config --global --add safe.directory "$FLUTTER_ROOT/.pub-cache" || true
git config --global --add safe.directory '*' || true

export PATH="$FLUTTER_ROOT/bin:$PATH"
export PUB_CACHE="$FLUTTER_ROOT/.pub-cache"
export CHROME_EXECUTABLE=""

echo "➡️  Versões:"
flutter --version --suppress-analytics || true
dart --version || true

echo "➡️  Habilitando Web + precache"
flutter config --enable-web --suppress-analytics
flutter precache --web --suppress-analytics

echo "➡️  pub get"
flutter pub get

echo "➡️  Verificando pubspec está aqui"
test -f "pubspec.yaml"

echo "➡️  Build web (release)"
flutter build web --release \
  --dart-define=API_BASE_URL="${API_BASE_URL:-https://shiftspace-health.onrender.com}" \
  --suppress-analytics

echo "✅ Build pronto em build/web"
