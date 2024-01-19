# # Установка дополнительных пакетов пакетов
#  install.packages("reader")
#  install.packages("jsonlite")
#  install.packages("data.table")
# install.packages("tidyverse")

# # Загрузка библиотек
# library(readr)
library(data.table)
# library(tidyverse)

# Загрузка данных из CSV файла
data <- read.csv("semex.csv", header = TRUE, sep = ";")

# Удаление строк с пропущенными значениями
data_clean <- data[complete.cases(data),]

# Размерность исходной таблицы
print(dim(data))

# Размерность обработанной таблицы
print(dim(data_clean))

data <- data.table(data_clean)
# выводим в формате data.table

# Задание 6: Определение выбросов с помощью фильтра Хампеля

# Функция для определения выбросов с использованием фильтра Хампеля
hampel_filter <- function(x, k = 3, t0 = 3) {
  n <- length(x)
  y <- rep(NA, n)
  for (i in 1:n) {
    if (i <= k || i >= n - k) {
      y[i] <- x[i]
    } else {
      window <- x[(i - k):(i + k)]
      median_window <- median(window, na.rm = TRUE)
      mad_window <- mad(window, na.rm = TRUE)
      if (abs(x[i] - median_window) > t0 * mad_window) {
        y[i] <- NA
      } else {
        y[i] <- x[i]
      }
    }
  }
  return(y)
}

# Применение фильтра Хампеля к столбцам TPI, milk, fat, protein
cols_to_filter <- c("TPI", "Milk", "Fat", "Protein")

# for (col_name in cols_to_filter) {
#   data[, (col_name) := hampel_filter(data[[col_name]]), by = .(col_name)]
# }

for (col_name in cols_to_filter) {
  data[, (col_name) := hampel_filter(.SD), .SDcols = col_name]
}

# print(data)
# Вывод обработанной таблицы
cat("Обработанная таблица: ", nrow(data), " строк и ", ncol(data), " столбцов\n")