#!/bin/bash

# Скрипт для деплоя на GitHub Pages
echo "🚀 Начинаем деплой на GitHub Pages..."

# Проверка наличия .env файла
if [ ! -f .env.local ]; then
    echo "❌ Ошибка: Файл .env.local не найден!"
    echo "Создайте файл .env.local с переменными:"
    echo "NEXT_PUBLIC_SUPABASE_URL=ваш_url"
    echo "NEXT_PUBLIC_SUPABASE_ANON_KEY=ваш_key"
    exit 1
fi

# Установка зависимостей
echo "📦 Устанавливаем зависимости..."
npm install

# Сборка проекта
echo "🔨 Собираем проект..."
npm run build:static

if [ $? -eq 0 ]; then
    echo "✅ Сборка успешна!"
    echo ""
    echo "📋 Следующие шаги:"
    echo "1. Создайте репозиторий на GitHub"
    echo "2. Выполните команды:"
    echo "   git add ."
    echo "   git commit -m 'Deploy to GitHub Pages'"
    echo "   git remote add origin https://github.com/ваш-username/admin-panel.git"
    echo "   git branch -M main"
    echo "   git push -u origin main"
    echo "3. Включите GitHub Pages в Settings → Pages → Source: GitHub Actions"
    echo ""
    echo "🎉 Ваш сайт будет доступен по адресу:"
    echo "   https://ваш-username.github.io/admin-panel/"
else
    echo "❌ Ошибка при сборке проекта"
    exit 1
fi

