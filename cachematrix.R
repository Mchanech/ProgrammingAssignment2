## Constructs an invertible matrix and caches its inverse
## for later use. Code is heavily based on makeVector.R and
## makeCacheMatrix.R, provided by the course.

## Constructs a list with get(), set(), and solve() 
## functions for a matrix x

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
    	set <- function(y) {
            x <<- y
	    m <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) m <<- solve
	getinverse <- function() m
	list(set = set, get = get, setinverse = setinverse,
	     getinverse = getinverse)

}


## Stores the inverse of a matrix in an accessible (cached) variable
## if there is none already. Otherwise returns the inverted matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getinverse()
	if(!is.null(m)) {
		message("getting inverted matrix")
		return(m)
	}
	data <- x$get()
	m <- solve(data)
	x$setinverse(m)
	m
	}
