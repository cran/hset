\name{subset}

\alias{hset1.included.to.hset2}
\alias{hsets.are.equal}
\alias{<=}
\alias{>=}
\alias{<}
\alias{>}
\alias{\%=<=\%}
\alias{\%=>=\%}
\alias{\%=<\%}
\alias{\%=>\%}
\alias{==}
\alias{!=}


\title{Binary subset and equality relations}
\description{Parametrized subset and equality relations between two \code{"hset"} objects.}
\usage{
hset1.included.to.hset2(hset1, hset2, strictly = FALSE, exactly = FALSE)
hset1 <= hset2 # strictly = FALSE, exactly = FALSE
hset1 >= hset2
hset1 <  hset2 # strictly = TRUE,  exactly = FALSE
hset1 >  hset2
hset1 \%=<=\% hset2 # strictly = FALSE, exactly = TRUE
hset1 \%=>=\% hset2
hset1 \%=<\%  hset2 # strictly = TRUE,  exactly = TRUE
hset1 \%=>\%  hset2

hsets.are.equal(hset1, hset2)
hset1 == hset2
hset1 != hset2
}
\arguments{
  \item{hset1, hset2}{objects of class \code{"hset"}.}
  \item{strictly, exactly}{logical flags indicating which type of inclusion relation is evaluated.}
}
\details{
Argument \code{exactly} not used if the first two arguments are not generalized.
}

\value{
\code{TRUE} is returned if \code{hset1} and \code{hset2} are in the indicated relation, otherwise \code{FALSE} is returned.
}

\examples{
# subset and equality relation between sets
X1 <- hset(c(2,3)); X2 <- hset(c(2,3))
hset1.included.to.hset2(X1, X2) # X1 <= X2
hset1.included.to.hset2(X1, X2, strictly = TRUE) # X1 < X2
hsets.are.equal(X1, X2) 
X1 == X2; X1 != X2

# subset relations between multisets
Y1 <- hset(c(2,3), c(1,2))
Y2 <- hset(c(2,3,4), c(1,2,1))
Y3 <- hset(c(2,3,4), c(2,2,1))

hset1.included.to.hset2(Y1, Y2) 
Y1 <= Y2; Y1 >= Y2; Y1 != Y2; Y1 < Y2
hset1.included.to.hset2(Y1, Y2, exactly = TRUE) # Y1 \%=<=\% Y2
Y1 \%=<=\% Y3; Y1 \%=<\% Y2; Y1 \%=<\% Y3
}
