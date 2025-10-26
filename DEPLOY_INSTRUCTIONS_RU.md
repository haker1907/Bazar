# 🚀 Инструкция по размещению Admin Panel

## ✅ Способ 1: Vercel (Рекомендуется)

**Vercel** - лучший выбор для Next.js приложений, бесплатный хостинг с автоматическим деплоем.

### Шаги:

1. **Создайте репозиторий на GitHub:**
   - Зайдите на [github.com](https://github.com)
   - Нажмите "New repository"
   - Название: `admin-panel`
   - Оставьте репозиторий публичным или приватным
   - Нажмите "Create repository"

2. **Загрузите код на GitHub:**
   ```bash
   # В папке admin-panel выполните:
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/ваш-username/admin-panel.git
   git branch -M main
   git push -u origin main
   ```

3. **Разверните на Vercel:**
   - Перейдите на [vercel.com](https://vercel.com)
   - Нажмите "Sign Up" и войдите через GitHub
   - Нажмите "Add New Project"
   - Выберите репозиторий `admin-panel`
   - В разделе "Environment Variables" добавьте:
     - `NEXT_PUBLIC_SUPABASE_URL` = ваш URL Supabase
     - `NEXT_PUBLIC_SUPABASE_ANON_KEY` = ваш Anon Key Supabase
   - Нажмите "Deploy"

4. **Готово!** 
   - Ваш сайт будет доступен по адресу: `https://ваш-проект.vercel.app`
   - При каждом push на GitHub, Vercel автоматически обновит сайт

---

## 📘 Способ 2: GitHub Pages (Статический экспорт)

⚠️ **Внимание:** Для GitHub Pages уже настроен статический экспорт (см. `next.config.ts`)

### Шаги:

1. **Загрузите код на GitHub** (см. выше)

2. **Настройте Secrets для GitHub Actions:**
   - Откройте ваш репозиторий на GitHub
   - Перейдите в Settings → Secrets and variables → Actions
   - Нажмите "New repository secret"
   - Добавьте секреты:
     - Имя: `NEXT_PUBLIC_SUPABASE_URL`, Значение: ваш URL
     - Имя: `NEXT_PUBLIC_SUPABASE_ANON_KEY`, Значение: ваш Key

3. **Включите GitHub Pages:**
   - Settings → Pages
   - Source: "GitHub Actions"
   - Сохраните

4. **Загрузите код и запустите деплой:**
   ```bash
   git add .
   git commit -m "Add deployment config"
   git push origin main
   ```

5. **Готово!**
   - Сайт будет доступен по адресу: `https://ваш-username.github.io/admin-panel/`
   - Деплой занимает 2-5 минут
   - Следите за процессом в разделе "Actions"

---

## 🌐 Способ 3: Netlify

1. **Загрузите код на GitHub** (см. выше)

2. **Разверните на Netlify:**
   - Перейдите на [netlify.com](https://netlify.com)
   - Войдите через GitHub
   - Нажмите "Add new site" → "Import an existing project"
   - Выберите GitHub и ваш репозиторий
   - Build command: `npm run build`
   - Publish directory: `.next` (или `out` для статического экспорта)
   - Environment variables:
     - `NEXT_PUBLIC_SUPABASE_URL`
     - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - Нажмите "Deploy site"

3. **Готово!** Сайт доступен по адресу: `https://ваш-сайт.netlify.app`

---

## 🔧 Важные настройки

### Переменные окружения (Environment Variables):
Всегда добавляйте эти переменные на хостинге:
```env
NEXT_PUBLIC_SUPABASE_URL=https://ваш-проект.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=ваш_anon_key
```

### Для GitHub Pages:
- Измените `basePath` в `next.config.ts` на название вашего репозитория
- Например, если репозиторий `my-admin`, измените на:
  ```typescript
  basePath: process.env.NODE_ENV === 'production' ? '/my-admin' : '',
  ```

---

## ✅ Проверка деплоя

После деплоя проверьте:
1. Открывается ли главная страница
2. Работает ли авторизация
3. Загружаются ли изображения из Supabase
4. Работает ли создание продуктов

---

## 🐛 Решение проблем

### 1. "Page not found" на GitHub Pages
- Убедитесь, что в `next.config.ts` правильно указан `basePath`
- Проверьте, что в папке `public/` есть файл `.nojekyll`

### 2. Ошибка "Environment variables not found"
- Добавьте переменные в настройках хостинга
- Для GitHub Pages: добавьте в Secrets
- Для Vercel/Netlify: добавьте в Environment Variables

### 3. Белый экран после деплоя
- Откройте DevTools (F12) и проверьте Console на ошибки
- Проверьте, что Supabase URL и Key корректны
- Убедитесь, что RLS политики настроены в Supabase

### 4. Изображения не загружаются
- Проверьте CORS настройки в Supabase Storage
- Убедитесь, что bucket `product-images` публичный

---

## 📞 Поддержка

При проблемах с деплоем:
1. Проверьте логи в разделе "Actions" (GitHub) или "Deploys" (Vercel/Netlify)
2. Убедитесь, что все зависимости установлены (`npm install`)
3. Проверьте версию Node.js (должна быть 18+)

---

## 🎉 Успешного деплоя!

Рекомендуем **Vercel** для лучшей производительности и простоты использования.

