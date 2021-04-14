source("functions.r")

df <- data.frame(
  x = 1:10,
  a1 = c(1,2,1,2,1,2,2,2,1,1),
  a2 = c(1,1,1,2,1,2,1,1,1,1),
  a3 = c(2,2,1,2,2,2,2,1,2,1),
  a4 = c(2,2,3,1,2,1,3,3,1,1),
  a5 = c(1,2,1,2,1,1,1,2,1,1),
  c = c(0,0,0,0,0,0,1,1,1,1)
)
print(df)
cat('\n')

isSilent <- TRUE

IsFromEntropy(df$a1, df$c)
IsFromEntropy(df$a2, df$c)
IsFromEntropy(df$a3, df$c)
IsFromEntropy(df$a4, df$c)
IsFromEntropy(df$a5, df$c)

