#!/bin/bash

# Пустая строка для вывода текста
echo ""

localHome="$HOME"

# Получаем список установленных Flatpak приложений
apps=$(flatpak list --app --columns=application)

# Перебираем папки в директории /home/platon/.var/app
for folder in $localHOME/.var/app/*/
do
# Получаем имя папки из пути
folder_name=$(basename $folder)

# Проверяем, присутствует ли имя папки в списке установленных приложений
if [[ ! $apps =~ $folder_name ]]; then
echo "Удаляем папку: $folder_name"
rm -rf "$folder"
fi
done

# Выводим сообщение о завершении скрипта
echo "Готово!"
