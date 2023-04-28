\name{in}

\alias{inclusion.member}
\alias{\%in\%}

\title{Parametrized inclusion predicate between a member and an \code{"hset"} object}
\description{\code{TRUE} is returned when the argument \code{member} is included in the set (or multiset) \code{hset}, otherwise \code{FALSE} is returned.}
\usage{
inclusion.member(member, hset, multiplicity = 1L, type.relation = `<=`)
member \%in\% hset # default for multiplicity and type.relation
}
\arguments{
  \item{member}{vector of length \code{1} that, when converted to a \code{"character"}, labels the element that can be included in the set.}
  \item{hset}{object of class \code{"hset"} that could contain \code{member}.}
  \item{multiplicity}{how many times \code{member} is inclued in \code{hset}.}
  \item{type.relation}{one of the six binary relational operator, e.g., \code{\link{<}}.}
}
\details{
Arguments \code{multiplicity} and \code{type.relation} used only when argument \code{hset} is generalized.
}

\value{
\code{TRUE} is returned if \code{member} and \code{hset} are in relation, otherwise \code{FALSE} is returned.
}

\examples{
inclusion.member(2, hset(c(2,3))) 
2 \%in\% hset(c(2,3))
inclusion.member(1, hset(c(2,3))) # 1 \%in\% hset(c(2,3))

inclusion.member(2, hset(c(2,3), generalized = TRUE))
inclusion.member(2, hset(c(2,3), c(.5, 1))) # default multiplicity is 1
inclusion.member(2, hset(c(2,3), c(.5, 1)), .5)
inclusion.member(2, hset(c(2,3), c(.5, 1)), .5, `<`) # strict inclusion
}
