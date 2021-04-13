df <- data.frame(
  x = 1:10,
  a1 = c(1,1,1,2,2,1,1,1,2,2),
  a2 = c(1,2,3,1,2,1,2,3,2,3),
  a3 = c(2,3,4,1,2,1,1,4,3,2),
  c = c(0,0,0,0,0,1,1,1,1,1)
)
print(df)
cat('\n')

laplaceSmooth <- function(vect, n, l) {
    A <- unique(c(vect, n))
    nom <- sum(vect == n) + l
    denom <- length(vect)+length(A)
    print(paste(nom, "/", denom))
}

entropy <- function(vect) {
    A <- unique(vect)
    entropy <- 0
    for (v in A) {
        nom <- sum(vect == v)
        denom <- length(vect)
        Ps <- nom/denom
        skladnik <- -Ps*log10(Ps)
        entropy <- entropy + skladnik
        print(paste("-", nom, "/", denom, "*log", nom, "/", denom, "=", round(skladnik, digits = 3)))
    }
    entropy <- round(entropy, digits = 2)
    print(paste("=", entropy))
    return (entropy)
}

Ps <- function(a,v) {
    res <- sum(a == v)/length(a)
    # print(res)
    return (res)
}

PsLong <- function(a1,v1,a2,v2) {
    counter <- 0
    for (i in 1:length(a1)) {
        if (a1[i] == v1 && a2[i] == v2) {
            counter <- counter + 1
        }
    }
    # print(counter/length(a1))
    return (counter/length(a1))
}

Is <- function(vect1, vect2) {
    A1 <- unique(vect1)
    A2 <- unique(vect2)
    res <- 0
    for (v1 in A1) {
        for (v2 in A2) {
            pslong = PsLong(vect1,v1,vect2,v2)
            ps1 = Ps(vect1, v1)
            ps2 = Ps(vect2, v2)
            print(paste(pslong, ps1, ps2))
            res <- res + pslong*log10(pslong/(ps1*ps2))
        }
        res <- round(res, digits = 5)
    }
    print(paste("Is:", res))
}

# entropyConditioned(vect1, vect2) {
#     A2 <- unique(vect2)
#     res <- 0
#     for (v in A2) {
#         (sum(vect2 == v)/length(vect)) * entropy(sum(vect2 == v), vect1)
#     }
#     return (res)
# }

print("Zad 1")
laplaceSmooth(df$a1, 3, 1)
laplaceSmooth(df$a2, 3, 1)
laplaceSmooth(df$a3, 3, 1)
cat('\n')

print("Zad 2")
entropies <- c(entropy(df$a1), entropy(df$a2), entropy(df$a3))
print(paste("Min:", min(entropies)))
cat('\n')

print("Zad 3")
Is(df$a1, df$c)
Is(df$a2, df$c)
Is(df$a3, df$c)
cat('\n')

print("Zad 5")
