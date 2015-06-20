## making a vector of inverse matrix of all the input matrix and read the cached matrix if it has been processed before

##getting the inverse of matrix and caching that inverse

makeCacheMatrix <- function(x = matrix()) {
	I<-NULL
	set <- function(y) {
		x <<- y
		I <<-NULL
	}
	get <- function()x
	setinv <- function(solve) I<<- solve
	getinv <- function() I
	list( set = set, get = get,
		  setinv = setinv,
		  getinv = getinv)
}


## testing whether there is a cached inversed matrix and get the cached matrix if there is one, otherwise calculates the data

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        I <- x$getinv()
        if (!is.null(I)) {
        	message("getting cached data")
        	return(I)
        }
        data <- x$get()
        I <- solve(data,...)
        x$setinv(I)
        I
}
