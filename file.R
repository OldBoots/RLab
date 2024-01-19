# install.packages("httpgd")

# data(InsectSprays)
attach(InsectSprays)

means_count <- tapply(count, spray, mean)

barplot(height = means_count,
        xlab = "Инсектицид",
        ylab = "Количество выживших насекомых")