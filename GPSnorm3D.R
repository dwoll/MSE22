library(rgl)
library(mvtnorm)
library(geometry)

source("GPSsimRadDistrFun.R")

#####---------------------------------------------------------------------------
#####---------------------------------------------------------------------------
## data that will be shown
nPts   <- 300
nGrid  <- 51
zscale <- 500
mu     <- c(0, 0)
sigma  <- matrix(c(13, 5, 5, 7), ncol=2)
xy     <- rmvnorm(nPts, mean=mu, sigma=sigma)

## apply(xy, 2, range)
## density over grid
X  <- seq(-10, 10, length.out=nGrid)
Y  <- seq(-10, 10, length.out=nGrid)
XY <- expand.grid(X=X, Y=Y)
Z  <- dmvnorm(XY, mean=mu, sigma=sigma)

## 50%, 95% ellipse with z=0
## magnification factor to turn error ellipse into confidence ellipse
radius   <- 1
mag50    <- sqrt(qchisq(0.50, 2))
mag95    <- sqrt(qchisq(0.95, 2))
nVertC   <- 100
nVertE   <- 100
anglesC  <- seq(0, 2*pi, length.out=nVertC)  # angles in radians
anglesE  <- seq(0, 2*pi, length.out=nVertE)  # angles in radians
CF       <- chol(sigma, pivot=TRUE)          # Cholesky-factor
CFord    <- order(attr(CF, "pivot"))
ell50    <- mag50*radius * cbind(cos(anglesE), sin(anglesE)) %*% CF[ , CFord]  # ellipse
ell50Ctr <- sweep(ell50, 2, mu, "+")        # move ellipse to center
ell95    <- mag95*radius * cbind(cos(anglesE), sin(anglesE)) %*% CF[ , CFord]  # ellipse
ell95Ctr <- sweep(ell95, 2, mu, "+")        # move ellipse to center

## for cylinder
nCyl <- 200 # number of cylinder faces

#####---------------------------------------------------------------------------
## draw scene
open3d()
clear3d("all")
view3d()
#bg3d(col="#887777")
bg3d(col="#ffffff")
light3d()

## ground plane
#planes3d(0, 0, 10, d=0, alpha=0.5, color="#cccccc")

## origin and in-plane axes
segments3d(c(0, 0), c(-10, 10), c(0, 0), lwd=2)
segments3d(c(-10, 10), c(0, 0), c(0, 0), lwd=2)

## draw confidence ellipses
#polygon3d(ell50Ctr[ , 1], ell50Ctr[ , 2], rep(0, nVert), col="red")       # ellipse
#lines3d(ell50Ctr[ , 1], ell50Ctr[ , 2], rep(0, nVertE), lwd=2)       # ellipse
lines3d(ell95Ctr[ , 1], ell95Ctr[ , 2], rep(0, nVertE), lwd=2)       # ellipse

## sample points
spheres3d(xy[ , 1], xy[ , 2], rep(0, nPts), radius=0.1, color="#8888BB")

## theoretical density mesh
surface3d(X, Y, zscale*Z, color="#FF9999", alpha=0.8, lwd=1.5, front="lines", back="cull")

id1 <- grid3d(c("x", "y+", "z"))
#id2 <- grid3d(c("x+", "y", "z"))
#id3 <- grid3d(c("x-", "y-", "z"))

rgl.bringtotop()
# aspect3d()
# axes3d()
# movie3d(spin3d(axis=c(0, 0, 1)), duration=15, dir=getwd())
# rgl.snapshot(filename="plot.png")
# rgl.postscript("plot.pdf", fmt="pdf")
