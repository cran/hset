\name{operations}

\alias{intersection}
\alias{union}
\alias{difference}
\alias{symmdiff}
\alias{setsum}

\alias{\%&~\%}
\alias{\%&&~\%}
\alias{\%and~\%}
\alias{\%&\%}
\alias{\%&&\%}
\alias{\%and\%}

\alias{\%|~\%}
\alias{\%||~\%}
\alias{\%or~\%}
\alias{\%|\%}
\alias{\%||\%}
\alias{\%or\%}

\alias{\%-~\%}
\alias{\%-\%}
\alias{\%!imp~\%}
\alias{\%!imp\%}

\alias{\%+~\%}
\alias{\%+\%}
\alias{\%sum~\%}
\alias{\%sum\%}

\alias{\%--~\%}
\alias{\%xor~\%}
\alias{\%--\%}
\alias{\%xor\%}


\title{Set and multiset operations}
\description{Operations between \code{"hset"} objects.}
\usage{
intersection(hset1, ..., semantic = "refer")
hset1 \%&\%  hset2 # refer semantic, operator equivalent to \%&&\%  , \%and\%
hset1 \%&~\% hset2 # value semantic, operator equivalent to \%&&~\% , \%and~\%

union(hset1, ..., semantic = "refer")
hset1 \%|\%  hset2 # refer semantic, operator equivalent to \%||\%  , \%or\%
hset1 \%|~\% hset2 # value semantic, operator equivalent to \%||~\% , \%or~\%

difference(hset1, ..., semantic = "refer")
hset1 \%-\%  hset2 # refer semantic, operator equivalent to \%!imp\%
hset1 \%-~\% hset2 # value semantic, operator equivalent to \%!imp~\%

symmdiff(hset1, ..., semantic = "refer")
hset1 \%--\%  hset2 # refer semantic, operator equivalent to \%xor\%
hset1 \%--~\% hset2 # value semantic, operator equivalent to \%xor~\%

setsum(hset1, ..., semantic = "refer")
hset1 \%+\%  hset2 # refer semantic, operator equivalent to \%sum\%
hset1 \%+~\% hset2 # value semantic, operator equivalent to \%sum~\%
}
\arguments{
  \item{hset1}{first operand, which is an object of class \code{"hset"}.}
  \item{hset2}{second operand, which is an object of class \code{"hset"}, used with infix operators.}
  \item{...}{other operands, which are all objects of class \code{"hset"}.}
  \item{semantic}{either \code{"refer"} or \code{"value"}.}
}
\details{
If \code{...} is empty, \code{hset1} is returned.

The returned object is a multiset if at least one operand is as such, otherwise the returned object is a set.

If reference semantic is used, the returned value and the first operand point to the same object in memory, as the first operand has been modified in place to produce the returned value. So after an operation with reference semantic, the original operand can not be accessed directly.
}

\value{
Object of class \code{"hset"} that is the result of the operation.
}

\examples{
## operations between sets
X1 <- hset(c(2,3,4)); X2 <- hset(c(2,3,5))
intersection(X1, X2, semantic = "value") # X1 \%&~\% X2
union(X1, X2, semantic = "value") # X1 \%|~\% X2
difference(X1, X2, semantic = "value") # X1 \%-~\% X2
symmdiff(X1, X2, semantic = "value") # X1 \%--~\% X2
setsum(X1, X2, semantic = "value") # X1 \%+~\% X2

## semantic of operations
X1 # same as before, as value semantic is used so far
union(X1, X2) # union with reference semantic
X1 # result of previous computation

## operations between multisets
Y1 <- hset(c(2,3,4), c(2,1,.5)); Y2 <- hset(c(2,3,5), c(1,1,.5))
intersection(Y1, Y2, semantic = "value") # Y1 \%&~\% Y2
union(Y1, Y2, semantic = "value") # Y1 \%|~\% Y2
difference(Y1, Y2, semantic = "value") # Y1 \%-~\% Y2
symmdiff(Y1, Y2, semantic = "value") # Y1 \%--~\% Y2
setsum(Y1, Y2, semantic = "value") # Y1 \%+~\% Y2

## mixed operation
Y3 <- setsum(Y1, X2, semantic = "value")
Y3
}
