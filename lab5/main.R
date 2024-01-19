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
data_clean <- na.omit(data)

# Размерность исходной таблицы
print(dim(data))

# Размерность обработанной таблицы
print(dim(data_clean))

# выводим в формате data.table
# print(data.table(data_clean)) 
