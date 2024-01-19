# Подключаем библиотеку для работы с данными
library(datasets)

# Загрузка данных state.x77
# data(state.x77)

# Выборка столбцов 2-8
selected_columns <- state.x77[, 2:8]

# Функция для расчета данных по столбцам
# Получает на вход стобец column
# mean() - среднее значение
# sd() - стандартное отклонение
# median() - медиана
# quantile() - квантили
# c() - помещает записи в вектор
# list() - создаем список со следущими полями mean, sd, median, quantiles
# return() - возвращаем список
calculate_stats <- function(column) {
    mean_value <- mean(column)
    sd_value <- sd(column)
    median_value <- median(column)
    quantiles_value <- quantile(column, probs = c(0.25, 0.5, 0.75))
    return(list(mean = mean_value, sd = sd_value, median = median_value, quantiles = quantiles_value))
}

# Цикл для расчета показателей для каждого столбца
# ncol() - возвращает кол-во столбцов
# seq_len() - задает последовательность заданной длинны
# colnames() - получаем имя i-ого столбца
# calculate_stats() - наша функция
# cat() - объеденяет строки и выводит их
for (i in seq_len(ncol(selected_columns))) {
    column_name <- colnames(selected_columns)[i]
    stats <- calculate_stats(selected_columns[, i])
    cat("Статистика для", 1 + i, "столбца -", column_name, "\n")
    cat("Среднее:", stats$mean, "\n")
    cat("Стандартное отклонение:", stats$sd, "\n")
    cat("Медиана:", stats$median, "\n")
    cat("Квартили (25%, 50%, 75%):", stats$quantiles, "\n\n")
}
