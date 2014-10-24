makeCacheMatrix <- function(x = matrix()) {
## This function creates a list of 4 functions that allows
## for caching of a desired solution (in this case the inverse of a matrix
## , but mean/sum/etc is also possible). The functions in the list allow
## for easy setting of new data to replace cached data (SET), get the 
## cached solution (GETINVERSE), or get the data used for deriving the
## cached solution (GET). The fourth function is used in a different function
## cacheSolve.R to actually cache the solution (SETINVERSE)
    ## initialize inv to NULL  
    inv <- NULL
        
        ## function SET for replacing data with other data, resetting the
        ## cached inv to NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        ## function GET to retrieve the current data
        get <- function() x
        ## function SETINVERSE used to cache the matrix inverse 
        setinverse <- function(inverse) inv <<- inverse
        ## function GETINVERSE to retrieve the cached solution
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}