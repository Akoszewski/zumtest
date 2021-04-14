source("functions.r")
library("plotROC")

df <- data.frame(
  x = 1:10,
  a1 = c(1,2,1,2,1,2,2,2,1,1),
  a2 = c(1,1,1,2,1,2,1,1,1,1),
  a3 = c(2,2,1,2,2,2,2,1,2,1),
  a4 = c(2,2,3,1,2,1,3,3,1,1),
  a5 = c(1,2,1,2,1,1,1,2,1,1),
  c = c(0,0,0,0,0,0,1,1,1,1),
  P = c(0.3, 0.4, 0.1, 0.6, 0.2, 0.5, 0.4, 0.7, 0.9, 0.6)
)
print(df)
cat('\n')

isSilent <- TRUE

print("Zad 1")
IGFromEntropy(df$a1, df$c)
IGFromEntropy(df$a2, df$c)
IGFromEntropy(df$a3, df$c)
IGFromEntropy(df$a4, df$c)
IGFromEntropy(df$a5, df$c)
cat("\n")

print("Zad 6")
roc.estimate <- calculate_roc(df$P, df$c, ci = FALSE)
roc.estimate
single.rocplot <- ggroc(roc.estimate)
plot_journal_roc(single.rocplot)

print("Misc:")
