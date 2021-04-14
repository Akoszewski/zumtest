source("functions.r")

df <- data.frame(
  x = 1:10,
  a1 = c(1,1,1,2,2,1,1,1,2,2),
  a2 = c(1,2,3,1,2,1,2,3,2,3),
  a3 = c(2,3,4,1,2,1,1,4,3,2),
  c = c(0,0,0,0,0,1,1,1,1,1)
)
print(df)
cat('\n')

isSilent <- TRUE

print("Zad 1")
laplaceSmooth(df$a1, 3, 1)
laplaceSmooth(df$a2, 3, 1)
laplaceSmooth(df$a3, 3, 1)
cat('\n')

print("Zad 2")
entropies <- c(entropy(df$a1), entropy(df$a2), entropy(df$a3))
entropies
print(paste("Min:", min(entropies)))
cat('\n')

print("Zad 3")
print(paste("IG:", IG(df$a1, df$c), "IG from entropy:", IGFromEntropy(df$a1, df$c)))
print(paste("IG:", IG(df$a2, df$c), "IG from entropy:", IGFromEntropy(df$a2, df$c)))
print(paste("IG:", IG(df$a2, df$c), "IG from entropy:", IGFromEntropy(df$a2, df$c)))
cat('\n')

print("Zad 5")
