\encoding{latin1}
\name{procuste}
\alias{procuste}
\alias{plot.procuste}
\alias{print.procuste}
\alias{randtest.procuste}
\title{Simple Procruste Rotation between two sets of points}
\description{
performs a simple procruste rotation between two sets of points. 
}
\usage{
procuste(dfX, dfY, scale = TRUE, nf = 4, tol = 1e-07) 
\method{plot}{procuste}(x, xax = 1, yax = 2, \dots)
\method{print}{procuste}(x, \dots)
\method{randtest}{procuste}(xtest, nrepet = 999, \dots)
}
\arguments{
  \item{dfX, dfY}{two data frames with the same rows}
  \item{scale}{a logical value indicating whether a transformation by the Gower's scaling (1971) should be applied}
  \item{nf}{an integer indicating the number of kept axes}
  \item{tol}{a tolerance threshold to test whether the distance matrix is Euclidean : an eigenvalue is considered positive if it is larger than \code{-tol*lambda1} where \code{lambda1} is the largest eigenvalue.}
  \cr
  \item{x, xtest}{an objet of class \code{procuste}}
  \item{xax}{the column number for the x-axis}
  \item{yax}{the column number for the y-axis}
  \item{nrepet}{the number of repetitions to perform the randomization test}
  \item{\dots}{further arguments passed to or from other methods}
}
\value{
returns a list of the class \code{procuste} with 9 components 
  \item{d}{a numeric vector of the singular values}
  \item{rank}{an integer indicating the rank of the crossed matrix}
  \item{nf}{an integer indicating the number of kept axes}
  \item{tabX}{a data frame with the array X, possibly scaled}
  \item{tabY}{a data frame with the array Y, possibly scaled}
  \item{rotX}{a data frame with the result of the rotation from array X to array Y}
  \item{rotY}{a data frame with the result of the rotation from array Y to array X}
  \item{loadX}{a data frame with the loadings of array X}
  \item{loadY}{a data frame with the loadings of array Y}
  \item{scorX}{a data frame with the scores of array X}
  \item{scorY}{a data frame with the scores of array Y}
  \item{call}{a call order of the analysis}
}
\author{
Daniel Chessel \cr
Anne B Dufour \email{anne-beatrice.dufour@univ-lyon1.fr}
}
\references{
Digby, P. G. N. and Kempton, R. A. (1987) Multivariate Analysis of Ecological Communities. \emph{Population and Community Biology Series}, Chapman and Hall, London.\cr\cr
Gower, J.C. (1971) Statistical methods of comparing different multivariate analyses of the same data. In \emph{Mathematics in the archaeological and historical sciences}, Hodson, F.R, Kendall, D.G. & Tautu, P. (Eds.) University Press, Edinburgh,  138--149.\cr\cr
Sch�nemann, P.H. (1968) On two-sided Procustes problems. \emph{Psychometrika}, \bold{33}, 19--34.\cr\cr
Torre, F. and Chessel, D. (1994) Co-structure de deux tableaux totalement appari�s. \emph{Revue de Statistique Appliqu�e}, \bold{43}, 109--121.\cr\cr
Dray, S., Chessel, D. and Thioulouse, J.  (2003) Procustean co-inertia analysis for the linking of multivariate datasets. \emph{Ecoscience}, \bold{10}, 1, 110-119.
}
\examples{
data(macaca)
pro1 <- procuste(macaca$xy1, macaca$xy2, scal = FALSE)
pro2 <- procuste(macaca$xy1, macaca$xy2)
if(adegraphicsLoaded()) {
  g1 <- s.match(pro1$tabX, pro1$rotY, plab.cex = 0.7, plot = F)
  g2 <- s.match(pro1$tabY, pro1$rotX, plab.cex = 0.7, plot = F)
  g3 <- s.match(pro2$tabX, pro2$rotY, plab.cex = 0.7, plot = F)
  g4 <- s.match(pro2$tabY, pro2$rotX, plab.cex = 0.7, plot = F)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
} else {
  par(mfrow = c(2, 2))
  s.match(pro1$tabX, pro1$rotY, clab = 0.7)
  s.match(pro1$tabY, pro1$rotX, clab = 0.7)
  s.match(pro2$tabX, pro2$rotY, clab = 0.7)
  s.match(pro2$tabY, pro2$rotX, clab = 0.7)
  par(mfrow = c(1,1))
}

data(doubs)
pca1 <- dudi.pca(doubs$env, scal = TRUE, scann = FALSE)
pca2 <- dudi.pca(doubs$fish, scal = FALSE, scann = FALSE)
pro3 <- procuste(pca1$tab, pca2$tab, nf = 2)
if(adegraphicsLoaded()) {
  g11 <- s.traject(pro3$scorX, plab.cex = 0, plot = F)
  g12 <- s.label(pro3$scorX, plab.cex = 0.8, plot = F)
  g1 <- superpose(g11, g12)
  g21 <- s.traject(pro3$scorY, plab.cex = 0, plot = F)
  g22 <- s.label(pro3$scorY, plab.cex = 0.8, plot = F)
  g2 <- superpose(g21, g22)
  g3 <- s.arrow(pro3$loadX, plab.cex = 0.75, plot = F)
  g4 <- s.arrow(pro3$loadY, plab.cex = 0.75, plot = F)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))

} else {
  par(mfrow = c(2, 2))
  s.traject(pro3$scorX, clab = 0)
  s.label(pro3$scorX, clab = 0.8, add.p = TRUE)
  s.traject(pro3$scorY, clab = 0)
  s.label(pro3$scorY, clab = 0.8, add.p = TRUE)
  s.arrow(pro3$loadX, clab = 0.75)
  s.arrow(pro3$loadY, clab = 0.75)
  par(mfrow = c(1, 1))
}

plot(pro3)
randtest(pro3)

data(fruits)
plot(procuste(scalewt(fruits$jug), scalewt(fruits$var)))
}
\keyword{multivariate}
