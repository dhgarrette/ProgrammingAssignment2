## Assignment 2: This pair of functions demonstrates the ability to cache
##               objects to avoid recomputation.



##############################################################################
# This function initializes an immutable matrix cache object capable of 
# storing its inverse
#
#   @param x: a matrix to wrap with caching ability.  default: matrix() 
#   @return:  a cache object wrapping the given matrix

makeCacheMatrix <- function(x = matrix()) {
  xInv <- NULL                        # create an inverse variable
  # set <- function(y) {
  #   x <<- y                           # store the matrix
  #   xInv <<- NULL                     # clear the inverse cache
  # }
  get <- function() x                 # return the matrix

  getInverse <- function() {
    if (is.null(xInv)) {               # If no inverse is cached
      message("computing inverse")
      xInv <<- solve(x)               # Find inverse and cache it
    }
    xInv                              # return the inverse
  }

  list(get = get, inverse = getInverse)
}


##############################################################################
# This function returns the inverse of a cached matrix
#
#   @param x: a matrix cache for which to compute (or get) the inverse
#   @return:  the inverse of the cached matrix

cacheSolve <- function(x) {
  x$inverse()  # Return the inverse
}




##############################################################################
# Usage example:
# 
# > m <- matrix(1:4,2,2)
# > c <- makeCacheMatrix(m)
# > c$get()
#      [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# > c$inverse()
# computing inverse        # note that the inverse is computed
#      [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# > c$inverse()            # note that the inverse is NOT re-computed
#      [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5

