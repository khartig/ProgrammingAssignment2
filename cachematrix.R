## This pair of functions caches the inverse of a matrix so unnecessary
## calculations are not perfomed. A call to cacheSolve returns the inverse
## of the matrix passed in asa the first parameter. A cached version of the 
## inverse is returned if exists. Othersise the matrix inversion calculation
## is performed and cache for future reference..
## The code assumes the matrix supplied is invertible and square.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then cacheSolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
