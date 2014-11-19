## 2 functions for Programming Assignment 2 for caching and using a matrix
## and its inverse
##-------------------------------------
## Use
##> m <- rbind(c(1, -1/4), c(-1/4, 1))
##> mc <- makeCacheMatrix(m)
##> mc$get()
##gives
##>      [,1]  [,2]
##>[1,]  1.00 -0.25
##>[2,] -0.25  1.00
##>cacheSolve(mc)
##gives
##     [,1]      [,2]
##[1,] 1.0666667 0.2666667
##[2,] 0.2666667 1.0666667
##second call to this function returns the cached inverse matrix with this additional message
##'Returning cached inverted matrix'
##----------------------------------------------

## makeCacheMatrix A function to hold a matrix it's inverse and the functions to get and set them
## set sets a matrix and clears any old inversed matrix
## get gets the stored matrix
## setinverse sets the inverse matrix
## getinverse gets the stored matrix
makeCacheMatrix <- function(x = matrix()) {
        inverseMatrix <- NULL
        
        # set the matrix and clear the inverse
        set <- function(y){
                x <<- y
                inverseMatrix <<- NULL
        }
        
        # get the matrix
        get <- fumnction() x
        
        # set the inverse matrix
        setinverse <- function(inverse) inverseMatrix <<- inverse
        
        # get the inverse matrix
        getinverse <- function() inverseMatrix
        #list out ther functions
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## A function to use the makeCacheMatrix object to return an inverse of a matrix
## from the cache if privously calculated or by a call to solve() if not.

## use call and pass in a makeCacheMatrix object 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        # try and get the cached inversed matrix
        invertmatrix <- x$getinverse()
        if(!is.null(invertmatrix)){
                message("Returning cached inverted matrix")
                return(invertmatrix)
        }
        # no cached inverted matrix so invert original and return it
        inversematrix <- solve(x$get(), ...)
        x$setinverse(inversematrix)
        return(inversematrix)
}
