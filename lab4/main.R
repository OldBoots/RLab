# install.packages("psych")
library(psych)

# Загрузка данных ChickWeight
data(ChickWeight)

# describeBy() - расчет нужной нам статистики
# ChickWeight$weight - нужная нам переменная
# list(ChickWeight$Chick, ChickWeight$Diet) - список групп. факторов
# mat = TRUE - вывести матрицей
result <- describeBy(ChickWeight$weight,
                    list(ChickWeight$Chick, ChickWeight$Diet), mat = TRUE)

# исключаем пустые строки и перезаписываем
result <- na.omit(result)

# Вывод результатов
print(result)