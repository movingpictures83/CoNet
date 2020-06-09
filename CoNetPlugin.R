library(CoNetinR)
input <- function(inputfile) {
   parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
  corr <<- as.matrix(read.csv(toString(parameters["correlations",2])))
  corr <<- corr[,-1]
  samples <<- as.integer(parameters["samples",2])
}

run <- function() {
 dataset <<- generateDataSet(samples, corr)
 rownames(dataset) <<- colnames(corr)
}

output <- function(outputfile) {
  write.csv(as.matrix(dataset), outputfile)
}
