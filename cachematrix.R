## The following functions create a matrix that can cache its 
## inverse and then calculate the inverse of the created matrix

makeCacheMatrix <- function(x = matrix()) {}
cacheSolve <- function(x, ...) {}

## The following function sets the value of the matrix and 
## makes the inverse variable NULL

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) inv <<- inverse
## setInverse() sets the inverse of the object inv
  
  getInverse <- function() inv
## getInverse() outputs the current inverse or value of the object inv
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



## The following function returns a matrix that is the inverse of 'x'


cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
## Finds whether or not the inverse has been calculated
  
  if(!is.null(inv)) {
## Output fetches data from the cache
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat,...)
## solve() calculates the inverse of the matrix
  x$setInverse(inv)
  inv
}
        ## Return a matrix that is the inverse of 'x'

