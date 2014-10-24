cacheSolve <- function(x, ...) {
## This function will take as input the list-output from makeCacheMatrix.R
## Using that list, the inverse of a matrix is computed and stored,
## or the cached inverse is retrieved and displayed
  
        ## from the list-output, use GETINVERSE to retrieve the matrix inverse
        inv <- x$getinverse()
        ## if inverse was already stored, it's retrieved here
        if(!is.null(inv)) {
                message("getting cached inverse")
                return(inv)
        }
        ## if the inverse was not already cached, the solution is computed
        ## and stored here
        matrix <- x$get()
        inv <- solve(matrix, ...)
        x$setinverse(inv)
        inv
}