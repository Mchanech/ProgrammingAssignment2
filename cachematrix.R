## Constructs an invertible matrix and caches its inverse
## for later use. Code is heavily based on makeVector.R and
## makeCacheMatrix.R, provided by the course.

## Constructs a list whose elements are simple functions
## get(), set(), and solve() for a matrix x

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL	## Initializes location for inverted matrix to go
    	
	## Populates the original matrix
	set <- function(y) {
            x <<- y	## Populates the original matrix
	    m <<- NULL
	}
	get <- function() x
	## 
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
