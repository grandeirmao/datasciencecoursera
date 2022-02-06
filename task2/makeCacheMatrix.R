#The second programming assignment will require you to write an R function 
#is able to cache potentially time-consuming computations. For example, 
#taking the mean of a numeric vector is typically a fast operation. 
#However, for a very long vector, it may take too long to compute the mean, 
#especially if it has to be computed repeatedly (e.g. in a loop). 
#If the contents of a vector are not changing, it may make sense to cache 
#the value of the mean so that when we need it again, it can be looked up in 
#the cache rather than recomputed. In this Programming Assignment will 
#take advantage of the scoping rules of the R language and how they can be 
#manipulated to preserve state inside of an R object

#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

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