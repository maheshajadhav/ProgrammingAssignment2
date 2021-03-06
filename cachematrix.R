## Puropse is to solve inverse of matrix provided that matrix must be invertible 


## This function creates a special “matrix” object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inpdata <- NULL
  set <- function(y){
    x <<- y
    inpdata <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) inpdata <<- inverse
  getInverse <- function() inpdata
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


## This function computes the inverse of the special “matrix” returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), 
##  then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inpdata <- x$getInverse()
  if(!is.null(inpdata)){
    message("getting cached data")
    return(inpdata)
  }
  inpmat <- x$get()
  inpdata <- solve(inpmat,...)
  x$setInverse(inpdata)
  inpdata
}
