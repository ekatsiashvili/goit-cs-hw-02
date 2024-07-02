#!/bin/bash

# Визначаємо масив з URL вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Визначаємо файл логів
log_file="website_status.log"

# Очищуємо попередній вміст файлу логів, якщо такий існує
> "$log_file"

# Цикл для обходу всіх сайтів у списку
for site in "${websites[@]}"; do
  # Використовуємо curl для перевірки статусу сайту з опцією -L для обробки переадресацій
  http_status=$(curl -o /dev/null -s -w "%{http_code}\n" -L "$site")

  # Перевірка HTTP статус-коду
  if [ "$http_status" -eq 200 ]; then
    echo "[$site] is UP"
    echo "[$site] is UP" >> "$log_file"
  else
    echo "[$site] is DOWN"
    echo "[$site] is DOWN" >> "$log_file"
  fi
done

# Виводимо повідомлення про завершення запису результатів у файл логів
echo "Результати записано у файл логів: $log_file"
