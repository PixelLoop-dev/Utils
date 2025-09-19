@echo off
set EMAIL=udalovmatvej69@gmail.com

:: Проверка наличия Git
where git >nul 2>&1
if errorlevel 1 (
  echo Git не найден! Открываю страницу загрузки...
  start https://git-scm.com/download/win
  pause
  exit /b
)

:: Проверка наличия ssh-keygen
where ssh-keygen >nul 2>&1
if errorlevel 1 (
  echo ssh-keygen не найден! Возможно, Git установлен без OpenSSH.
  pause
  exit /b
)

:: Папка для ключей
set "SSH_DIR=%USERPROFILE%\.ssh"
if not exist "%SSH_DIR%" mkdir "%SSH_DIR%"

:: Путь к ключу
set "KEYFILE=%SSH_DIR%\id_ed25519"

:: Генерация / перезапись
ssh-keygen -t ed25519 -C "%EMAIL%" -f "%KEYFILE%" -N ""

:: Автокопирование публичного ключа
type "%KEYFILE%.pub" | clip

:: Вывод
echo.
echo === Публичный ключ: (уже в буфере обмена) ===
type "%KEYFILE%.pub"
pause

