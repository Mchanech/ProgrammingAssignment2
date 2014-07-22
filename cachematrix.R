## Constructs an invertible matrix and caches its inverse
## for later use. Code is heavily based on makeVector.R and
## makeCacheMatrix.R, provided by the course.

## Constructs a list whose elements are simple functions
## get(), set(), and solve() for a matrix x

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL	## Initializes location for inverted matrix to go
    	
	set <- function(y) {
            x <<- y	## Stores original matrix in the child env
	    inv <<- NULL
	}

	## Retrieves original matrix
	get <- function() x

	## Stores inverse matrix locally
	setinverse <- function(solve) inv <<- solve
	
	## Retrieves inverse matrix
	getinverse <- function() inv
	
	## Returns a list containing the functions above
	list(set = set, get = get, setinverse = setinverse,
	     getinverse = getinverse)
}


## Stores the inverse of a matrix in an accessible (cached) variable
## if there is none there already. 
## Otherwise returns the inverted matrix.

cacheSolve <- function(x, ...) {
   
   	## Stores a matrix that is the inverse of 'x' locally
	inv <- x$getinverse()
	if(!is.null(inv)) {	## Returns inv as long as it exists
		message("getting inverted matrix")
		return(inv)
	}
	data <- x$get()	    ## Retrieves matrix 'x' 
	inv <- solve(data)  ## Generates inverse of 'x'
	x$setinverse(m)	    ## Caches inverse
	inv		    ## Returns inverse
}
