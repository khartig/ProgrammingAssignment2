## This pair of functions caches an inverted matrix so unnecessary
## inversion calculations are not performed. makeCacheMatrix defines a 
## cacheable matrix. cacheSolve inverts a cacheable matirx returned by
## makeCacheMatrix. The code assumes the matrix supplied is invertible and square.
##
## Example: 
##    > X = matrix(c(4, 3, 3, 2), nrow=2, ncol=2)
##    > cm <- makeCacheMatrix(X)
##    > cacheSolve(cm)
##    .... outputs inverted matrix ...
##    > cacheSolve(cm)
##    .... outputs inverted matrix from cache ...


## This function creates a special "matrix" that can be used
## to cache its inverse. It contains the original matrix
## and a cached version of its inverse. It also contains
## and returns a list of functions to get and set the matrix
## and its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    
    # set the matrix value
    set <- function(y) {
        x <<- y
        inverse <<- NULL # matrix has changed so set to NULL
    }
    
    # get the matrix value
    get <- function() x
    
    # Set the inverse value of the matrix
    setInverse <- function(solve) inverse <<- solve 
    
    # Get the cached inverse of the matrix
    getInverse <- function() inverse
    
    # return the list of functions
    list(set = set, 
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## This function returns the inverse of a matrix.
## The matrix passed in must be a makeCacheMatrix object.
## If the matrix doesn't exist in cache, it is calculated,
## saved to cache and then returned.
##
##  USAGE: cacheSolve(x, ...) - where 'x' is a
##         'makeCacheMatrix' object
##

cacheSolve <- function(x, ...) {
    # get inverse matrix from cache
    inverse <- x$getInverse()
    
    # if cached inverse exists return it
    # if yes, return cached inverse otherwise continue
    if (!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    
    # get the original matrix
    data <- x$get()
    
    # calculate the inverse with the solve function and passed in parameters
    inverse <- solve(data, ...)
    
    # save the inverted matrix in cache
    x$setInverse(inverse)
    
    # return the inverted matrix
    inverse
}
