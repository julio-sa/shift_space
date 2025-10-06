#!/usr/bin/env bash
set -euo pipefail

echo "➡️  Baixando Flutter SDK..."
FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz"
curl -L "$FLUTTER_URL" | tar -xJ

export PATH="$PWD/flutter/bin:$PATH"

echo "➡️  Versão do Flutter:"
flutter --version

echo "➡️  Habilitando web e instalando deps..."
flutter config --enable-web
flutter pub get

echo "➡️  Build web (release)..."
# API_BASE_URL vem das Environment Variables do Vercel
flutter build web --release \
  --dart-define=API_BASE_URL="${API_BASE_URL:-https://airaware-api.onrender.com}"

echo "✅ Build concluído. Saída em build/web"
