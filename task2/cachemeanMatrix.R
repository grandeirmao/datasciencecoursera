#This function computes the inverse of the matrix returned by makeCacheMatrix function
cachemeanMatrix <- function(x,  ...){
  #return the inverse Matrix of x
  invm <- x$getInverse
  
  #checking if there is cached data in 'invm'
  if(!is.null(invm)){
    message("getting cached data")
    return(invm)
  }
  
  #Associating the 'x' matrix value to 'data'
  data <- x$get()
  
  #returning an inverse matrix
  invm <- solve(data)
  x$setMean(invm)
  invm
}