% File src/library/base/man/load.Rd
\name{hset}

\alias{hset}
\alias{is.hset}
\alias{as.hset}
\alias{is.generalized}
\alias{as.generalized}
\alias{as.not.generalized}
\alias{clone.of.hset}
\alias{refer.to.hset}
\alias{members}
\alias{multiplicities}
\alias{size.support}
\alias{cardinality}

\title{\code{hset} data structure for the R language}
\description{Functions to construct and access objects of class \code{"hset"}, that implements sets and multisets.}
\usage{
hset(members = NULL, multiplicities = NULL, generalized = FALSE)

is.hset(x)
as.hset(x)

is.generalized(hset)
as.generalized(hset, suppress.warning = FALSE)
as.not.generalized(hset, suppress.warning = FALSE)

clone.of.hset(current.hset, generalized = NA_integer_)
refer.to.hset(current.hset, generalized = NA_integer_)

members(hset)
multiplicities(hset)
size.support(hset)
cardinality(hset)
}
\arguments{
  \item{members}{collection of elements of the set.}
  \item{multiplicities}{collection of multiplicities of the elements in \code{members}, argument used only when \code{generalized} is \code{TRUE}.}
  \item{generalized}{logical value indicating whether the returned object is a set, or a multiset.}
  \item{x}{object to be coerced or tested.}
  \item{hset}{object of class \code{"hset"}.}
  \item{suppress.warning}{avoid warning when \code{hset} is already generalized, or is already not generalized.}
  \item{current.hset}{object of class \code{"hset"} to be copied, or referred to}
}
\details{
\code{hset} is the constructor of a set or a multiset, implemented using the hash table from package \code{"hash"}.

For multisets, the arguments \code{members} and \code{multiplicities} have to be compatible. If the latter is \code{NULL} all members have multiplicity \code{1} by default, otherwise the two arguments must have the same length. If \code{multiplicities} is not \code{NULL}, it must be a vector of class \code{"numeric"} with the same length of \code{members}. The valid classes for the argument \code{members} are \code{"NULL"}, \code{"hset"}, or \code{"vector"}, in the third case, \code{members} can be of sub-class \code{"atomic"}, or of sub-class \code{"list"} containing objects of the classes indicated so far. The recursive definition of \code{"list"} objects allows the definition of elements of a set or a multiset that are themselves sets.

The function \code{is.hset} is used to check whether the object \code{x} is of class \code{"hset"}, whereas  \code{as.hset} is used to coerce \code{x} to an \code{"hset"} object.

The function \code{is.generalized} is used to check whether an object of class \code{"hset"} is a set or a multiset, \code{as.generalized} and \code{as.not.generalized} convert a set to a multiset and viceversa.

The functions \code{clone.of.hset} and \code{refer.to.hset} are used to copy an object of class \code{"hset"}, and refer to it, respectively.

The functions \code{members} and \code{multiplicities} return a vector of elements, with their corresponding multiplicities, respectively. The functions \code{size.support} and \code{cardinality} return the number of elements and the sum of the multiplicities, respectively.
}

\value{
Functions \code{hset}, \code{as.hset}, \code{as.generalized}, \code{as.not.generalized}, \code{clone.of.hset}, and \code{refer.to.hset} return an object of class \code{"hset"}; \code{is.hset} and \code{is.generalized} return a one dimensional \code{logical} value; \code{members} and \code{multiplicities} return a vector of class \code{"character"}; \code{size.support} and \code{cardinality} return a number.
}

\examples{
## create an empty set and an empty multiset
hset() # equivalent to hset(NULL), as.hset(list()), or hset(list())
hset(generalized = TRUE)

## create set {1,3,4} and multiset {1[2], 3[1], 4[.5]}
hset(c(1,3,4)) # equivalent to hset(c(1,1,3,4)) or hset(c(1,4,3))
hset(c(1,3,4), c(2,1,.5)) # equivalent to hset(c(1,1,3,4), c(1,1,1,.5))

## recursive definition of sets
hset(hset()) # equivalent to hset(list(list()))
hset(list(1, list(1,list()) )) # {{{},1},1}

## check and coerce hset objects
is.hset(hset())
as.hset(list())
# note that hset(hset()) and as.hset(hset()) are not equivalent

## canonical map from sets to multisets, and vice versa
hs <- hset(); is.generalized(hs)
as.generalized(hs); is.generalized(hs)
as.not.generalized(hs); is.generalized(hs)
# note reference semantic of hs

## value and reference semantics
hs <- hset(c(1,3,4))
hsc <- clone.of.hset(hs)
hsc <- union(hsc, hset(c(4,5)))
hsc; hs # value semantic
hsr <- refer.to.hset(hs) # equivalent to: hsr <- hs, or hsr = hs
hsc <- union(hsc, hset(c(4,5)))
hsr; hs # they refer to the same updated object in memory

## information extraction about hset objects
hm <- hset(c(1,4,3), c(2,.5,1), generalized = TRUE)
members(hm)
multiplicities(hm)
size.support(hm)
cardinality(hm)
}
%\keyword{file}
