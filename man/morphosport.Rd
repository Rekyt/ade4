\encoding{latin1}
\name{morphosport}
\alias{morphosport}
\docType{data}
\title{Athletes' Morphology}
\description{
This data set gives a morphological description of 153 athletes split in five different sports. 
 }
\usage{data(morphosport)}
\format{
\code{morphosport} is a list of 2 objects.
    \describe{
    \item{tab}{is a data frame with 153 athletes and 5 variables.}
    \item{sport}{is a factor with 6 items}
    }
}
\details{    
Variables of \code{morphosport$tab} are the following ones: dbi (biacromial diameter (cm)),
tde (height (cm)), tas (distance from the buttocks to the top of the head (cm)),
lms (length of the upper limbs (cm)), poids (weigth (kg)).\cr

The levels of \code{morphosport$sport} are: athl (athletics), foot (football),
hand (handball), judo, nata (swimming), voll (volleyball).
}
\source{
Mimouni , N. (1996) 
\emph{Contribution de m�thodes biom�triques � l'analyse de la morphotypologie des sportifs}. 
Th�se de doctorat. Universit� Lyon 1.
}
\examples{
data(morphosport)
plot(discrimin(dudi.pca(morphosport$tab, scan = FALSE), 
    morphosport$sport, scan = FALSE))
}
\keyword{datasets}
