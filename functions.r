isSilent <- FALSE

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
        skladnik <- -Ps*log2(Ps)
        entropy <- entropy + skladnik
        if (!isSilent) print(paste("-", nom, "/", denom, "*log", nom, "/", denom, "=", round(skladnik, digits = 3)))
    }
    # entropy <- round(entropy, digits = 2)
    if (!isSilent) print(paste("=", entropy))
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

getConditionedVect <- function(vect, vectWithCondition, condition) {
    res <- c()
    for (i in 1:length(vectWithCondition)) {
        if (vectWithCondition[i] == condition) {
            res <- c(res, vect[i])
        }
    }
    return (res)
}

# chyba cos tu nie dziala lepiej uzyc IGFromEntropy
IG <- function(vect1, vect2) {
    A1 <- unique(vect1)
    A2 <- unique(vect2)
    res <- 0
    for (v1 in A1) {
        for (v2 in A2) {
            pslong = PsLong(vect1,v1,vect2,v2)
            ps1 = Ps(vect1, v1)
            ps2 = Ps(vect2, v2)
            if (!isSilent) print(paste(pslong, ps1, ps2))
            res <- res + pslong*log2(pslong/(ps1*ps2))
        }
        res <- round(res, digits = 5)
    }
    if (!isSilent) print(paste("IG:",res))
    return (res)
}

IGFromEntropy <- function(vect1, vect2) {
    res <- entropy(vect1) - entropyConditioned(vect1, vect2)
    if (!isSilent) print(paste("IG from entropy:",res))
    return (res)
}

entropyConditioned <- function(vect1, vect2) {
    A2 <- unique(vect2)
    res <- 0
    for (v in A2) {
        res <- res + (sum(vect2 == v)/length(vect2)) * entropy(getConditionedVect(vect1, vect2, v))
        if (!isSilent) print(paste("res =",res))
    }
    return (res)
}