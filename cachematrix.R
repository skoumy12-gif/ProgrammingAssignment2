## These two functions cache the inverse of a matrix to save time.

## This function creates a special matrix object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  # Start with null inverse
  inv <- NULL
  
  # Function to set a new matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # Function to get the matrix
  get <- function() x
  
  # Function to save the inverse
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  
  # Function to get the saved inverse
  getInverse <- function() inv
  
  # Return the list of functions
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function computes the inverse of the special matrix.
## If it's already cached, it returns the cached version.
cacheSolve <- function(x, ...) {
  # Check if inverse is already cached
  inv <- x$getInverse()
  
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # Otherwise, get the matrix and calculate its inverse
  mat <- x$get()
  inv <- solve(mat, ...)
  
  # Cache the newly calculated inverse
  x$setInverse(inv)
  
  # Return the inverse
  inv
}
```eof

