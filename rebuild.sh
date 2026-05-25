#!/bin/bash

# Script para reconstruir containers Docker

echo "🐳 Parando containers existentes..."
docker-compose down

echo "🗑️  Limpando volumes antigos..."
docker volume rm bytestore_db_data 2>/dev/null || true

echo "🔨 Reconstruindo imagens..."
docker-compose build --no-cache

echo "🚀 Iniciando containers..."
docker-compose up -d

echo "⏳ Aguardando containers iniciarem..."
sleep 10

echo "📦 Executando migrações do banco..."
docker-compose exec -T app php artisan migrate --force

echo "🔑 Verificando se a APP_KEY foi gerada..."
docker-compose exec -T app php artisan key:generate --force

echo "📁 Criando diretórios necessários..."
docker-compose exec -T app php artisan storage:link

echo "✅ Pronto! Acesse http://localhost:8080"
echo ""
echo "Status dos containers:"
docker-compose ps
