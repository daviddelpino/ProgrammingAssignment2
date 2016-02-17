## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# The function creat the object 'makeCacheMatrix' with two atributes 'x' and 's'. 'x' represent the matrix origin 
# and 's' represent the inverse matrix. Also, the principal function, set and get for both original matrix and 
# inverse matrix, are defined. 

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y){
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve){
                s <<- solve
        }
        getsolve <- function () s
        # Add the 'invisible' function to not see the code on the screen when I call 'makeCacheMatrix'
        invisible(list(set = set, get = get, setsolve = setsolve, getsolve = getsolve))
}


## Write a short comment describing this function

# This function calculate the inverse matrix, the matrix that you put as the argument. This argument must be a object 'makeCacheMatrix'
# if the inverse of matrix is calculated, only display the value with a funny message.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s <- x$getsolve()
        if ((!is.null(s)) && (!is.na(s)) ) {
                message("Keep Calm and Think different!!")
                return(s)
        }
        
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}

# For example, I want the inverse of matrix:
#
#      [,1] [,2] [,3]
# [1,]    1    1    0
# [2,]    1    0    1
# [3,]    0    1    0

# First, I create the matrix with function 'matrix'
m <- matrix(c(1,1,0,1,0,1,0,1,0), nrow = 3, ncol = 3)

# Second, I call function 'makeCacheMatrix' to create the Object and store the result in a variable auxiliary 'Aux'.
Aux <- makeCacheMatrix(m)

# Third, call function 'cacheSolve' with the object 'Aux', to get inverse of matrix:
#
#      [,1] [,2] [,3]
# [1,]    1    0   -1
# [2,]    0    0    1
# [3,]   -1    1    1

# cacheSolve(Aux)

# To see the matrix origin you must write 'Aux$get()' and to see the inverse matrix you must write 'Aux$getsolve()'