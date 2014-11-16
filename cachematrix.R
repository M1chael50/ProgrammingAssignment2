## 2 function for Programming assignment 2 for caching a matrix and its inverse
## 

## A function to hold a matrix it's inverse and the functions to get and set them

makeCacheMatrix <- function(x = matrix()) {
        inverseMatrix <- NULL
        set <- function(y){
                x <<- y
                inverseMatrix <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inverseMatrix <<- inverse
        getinverse <- function() inverseMatrix
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## A function to use the makeCacheMatrix object to return an inverse of a matrix
## 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        return solve(x)
}
