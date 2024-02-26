install.packages(c("devtools","roxygen2","testthat","rmarkdown","pkgdown","purrr"))

usethis::use_git_config(user.name = "esragonen",
                        user.email="gonen.esra@metu.edu.tr")

usethis::create_github_token()
gitcreds::gitcreds_set()
usethis::git_sitrep()

###################################################################################



# Lecture 1

#exceptions and timings

vec1 <- c(1, 2, 3)
vec2 <- c(1,2)
vec1*vec2    # warning message. execute the code anyways

warn_test <- function(x){
  if(x<=0){
    warning("WATCH OUT! x is less than or equal to 0. set it 1.")
    x <- 1
  }
  return(2/x)
}

warn_test(10)
warn_test(0)    #gives warning message the code works 


error_test <- function(x){
  if(x<=0){
    stop("x is less than or equal to 0.... TERMINATE!")
  }
  return(2/x)
}

error_test(0)   # gives error code does not work

myfibrec <- function(n){
  if(n<0){
    warning("assuming you meant 'n' to be positive -- doing that instead")
    n <- n*-1
  }else if(n==0){
    stop("'n' is uninterpretable at 0")
  }
  if(n==1 || n==2){
    return(1)
  }else {
    return(myfibrec(n-1)+myfibrec(n-2))
  }
}

myfibrec(12)
myfibrec(0) # gives error
myfibrec(-12)

try(myfibrec(0), silent = T)

attempt1 <- try(myfibrec(0), silent= TRUE)
attempt1
class(attempt1)

attempt2 <- try(myfibrec(6), silent = T)
attempt2




myfibrecvector <- function(nvec){
  nterms <- length(nvec)
  result <- rep(0, nterms)
  for (i in 1:nterms){
    result[i] <- myfibrec(nvec[i])
  }
  return(result)
}


foo <- myfibrecvector(nvec = c(1, 2, 10, 8))
foo

bar <- myfibrecvector(nvec = c(3, 2, 7, 0, 9, 13))
# because of the zero it gives error


myfibrecvectormyway <- function(nvec){
  nterms <- length(nvec)
  result <- rep(0, nterms)
  for (i in 1:nterms){
    if (nvec[i] == 0){
      result[i] <- NA
    }else{
      result[i] <- myfibrec(nvec[i])
      
    }
    
  }
  return(result)
}
bar <- myfibrecvectormyway(nvec = c(3, 2, 7, 0, 9, 13))
bar



myfibrecvectorTRY <- function(nvec){
  nterms <- length(nvec)
  result <- rep(0, nterms)
  for (i in 1:nterms){
    attempt <- try(myfibrec(nvec[i]), silent = TRUE)
    if (class(attempt)== "try-error"){
      result[i] <- NA
    }else{
      result[i] <- myfibrec(nvec[i])
    }
    
  }
  return(result)
}

bar <- myfibrecvectorTRY(nvec = c(3, 2, 7, 0, 9, 13))
bar


myfibrec(-3)

attempt3 <- suppressWarnings(myfibrec(-3))
attempt3

#Progress and Timing

# textual progress bars 

Sys.sleep(10)  # waits 

sleep_test <- function(n){
  result <- 0
  for (i in 1:n){
    result <- result + 1
    Sys.sleep(0.5)
  }
  return(result)
}

sleep_test(4)

prog_test <- function(n){
  result <- 0
  progbar <- txtProgressBar(min = 0, max = n, style = 1, char = "=")
  for (i in 1:n){
    result <- result + 1
    Sys.sleep(0.5)
    setTxtProgressBar(progbar, value = i)
  }
  close(progbar)
  return(result)
}

prog_test(9)

prog_test(8)


# Measuring completion time
Sys.time()

t1 <- Sys.time()
Sys.sleep(3)
t2 <- Sys.time()
t2-t1


# Avoid for loops

d <- as.data.frame(cbind(runif(10000), runif(10000)))
head(d)

system.time(for (loop in 1:dim(d)[1])
  {
  d$mean2[loop] <- mean(c(d[loop, 1], d[loop, 2]))
})

system.time(d$mean1 <- apply(d, 1, mean))


df<- 1:10
lapply(2:3, function(i) df <- df*i)


install.packages("reshape2")
data(tips, package = "reshape2")
head(tips)

tips$tipgroup <- ifelse(tips$tip < 3, "lowtip", "hightip" )

















