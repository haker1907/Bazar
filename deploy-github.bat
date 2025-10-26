@echo off
REM Скрипт для деплоя на GitHub Pages (Windows)

echo 🚀 Начинаем деплой на GitHub Pages...
echo.

REM Проверка наличия .env.local файла
if not exist .env.local (
    echo ❌ Ошибка: Файл .env.local не найден!
    echo Создайте файл .env.local с переменными:
    echo NEXT_PUBLIC_SUPABASE_URL=ваш_url
    echo NEXT_PUBLIC_SUPABASE_ANON_KEY=ваш_key
    pause
    exit /b 1
)

REM Установка зависимостей
echo 📦 Устанавливаем зависимости...
call npm install

if errorlevel 1 (
    echo ❌ Ошибка при установке зависимостей
    pause
    exit /b 1
)

REM Сборка проекта
echo 🔨 Собираем проект...
call npm run build:static

if errorlevel 1 (
    echo ❌ Ошибка при сборке проекта
    pause
    exit /b 1
)

echo.
echo ✅ Сборка успешна!
echo.
echo 📋 Следующие шаги:
echo 1. Создайте репозиторий на GitHub
echo 2. Выполните команды:
echo    git add .
echo    git commit -m "Deploy to GitHub Pages"
echo    git remote add origin https://github.com/ваш-username/admin-panel.git
echo    git branch -M main
echo    git push -u origin main
echo 3. Включите GitHub Pages в Settings -^> Pages -^> Source: GitHub Actions
echo.
echo 🎉 Ваш сайт будет доступен по адресу:
echo    https://ваш-username.github.io/admin-panel/
echo.
pause

