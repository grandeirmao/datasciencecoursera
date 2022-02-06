## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  invm <- NULL
  
  #set the value of the matrix
  set <- function (y){
    x <<- y
    invm <<- NULL
  }
  
  #get the value of the matrix
  get <- function () x
  
  #set the value of the mean
  setMean <- function(mean) invm <<- mean
  
  #get the value of the mean
  getMean <- function () invm
  
  list(set = set, get = get, setMean = setMean, getMean = getMean)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
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
