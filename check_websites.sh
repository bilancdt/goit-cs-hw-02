#!/bin/bash

# Масив із вебсайтами для перевірки
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    "https://nonexistentwebsite.example"
    "https://www.skrill.com"
)

# Файл для логів
log_file="website_status.log"

# Очистка або створення нового файлу логів
> "$log_file"

# Повідомлення для користувача
echo "Перевірка доступності вебсайтів. Результати буде записано у файл $log_file"

# Перевірка кожного сайту
for website in "${websites[@]}"; do
    # curl для перевірки доступності (слідування переадресаціям -L)
    http_status=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")

    if [[ "$http_status" -eq 200 ]]; then
        echo "$website is UP" | tee -a "$log_file"
    else
        echo "$website is DOWN (HTTP Status: $http_status)" | tee -a "$log_file"
    fi
done

# Підсумкове повідомлення
echo "Результати перевірки записані у файл $log_file"
