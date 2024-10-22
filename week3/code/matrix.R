require(reshape2)
GenerateMatrix <- function(N){
    M <- matrix(runif(N * N), N, N)
    return(M)
}
M <- GenerateMatrix(10)
Melt <- melt(M)
p <- ggplot(Melt, aes(Var1, Var2, fill = value)) + geom_tile() + theme(aspect.ratio = 1)

p + geom_tile(colour = "black") + theme(aspect.ratio = 1)

p + theme(legend.position = "none") + theme(aspect.ratio = 1)

