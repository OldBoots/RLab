# Из репозитория CRAN
# install.packages("httpgd")
# install.packages("ggplot2")
# install.packages("readxl")
# data(InsectSprays)

attach(InsectSprays)

means_count <- tapply(count, spray, mean)

barplot(height = means_count,
    xlab = "Инсектицид",
    ylab = "Количество выживших насекомых")