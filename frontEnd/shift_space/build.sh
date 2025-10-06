#!/bin/bash
set -e

echo "🚀 Iniciando build do Flutter Web..."

# Download e setup do Flutter
if [ ! -d "flutter" ]; then
    echo "📦 Baixando Flutter..."
    git clone https://github.com/flutter/flutter.git -b stable
fi

# Configurar PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Configurar Flutter
echo "⚙️ Configurando Flutter..."
flutter config --enable-web --no-analytics
flutter doctor

# Instalar dependências
echo "📚 Instalando dependências..."
flutter pub get

# Build da aplicação
echo "🔨 Buildando aplicação..."
flutter build web --release --web-renderer html --dart-define=FLUTTER_WEB_USE_SKIA=false

echo "✅ Build concluído!"
