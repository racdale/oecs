
#
# 
# general structure of basic HKB model / coded by Rick Dale, fall 2023
#   informed by the following, with more derivation and examples:
#   Kelso (2008) http://www.scholarpedia.org/article/Haken-Kelso-Bunz_model
#
#

# HKB model's potential based on speed of movement (k) & relative phase of limbs
V = function(k,relphase) {
  return(-sin(relphase) - 2*k*sin(2*relphase))
}

# implement discretely updating HKB model for n updates; plot with time on y
hkb = function(k=0,n=50,add=FALSE,col='black',main='') {
  
  # initialize relative phase value from [-2 pi,2 pi]
  relphases = 2*pi*(runif(1)-0.5)
  
  # iterate and integrate potential (V) by small proportion
  for (i in 1:(n-1)) {
    relphases = c(relphases, relphases[i] + .01*V(k,relphases[i])) 
  }
  if (add) {
    points(relphases,1:n,type='l',lwd=.5,col=col)
  } else {
    plot(relphases,1:n,type='l',lwd=0.5,xlim=c(-pi,pi),bty='n',
         ylab='t (iteration)',xlab='Relative phase',col=col,xaxt='n')
    axis(1,at=c(-pi,0,pi),expression(-pi,0,pi))
    title(main=main,line=1)
  }
  
  return(relphases)
}

#
# plot k = .1 (fast), k = 1.1 (slow)
#

set.seed(42)

phaserange = seq(-pi,pi,length=100)

pdf(file='hkb.pdf',height=7,width=14)

layout_matrix = matrix(c(1,2),byrow = T,nrow = 1)
layout(layout_matrix)
par(oma=c(4,4,0,0),mar=c(0,0,4,2)+0.1)

# k = .1 (very fast movement)
# plot(phaserange,cumsum(V(k=.1,relphase=phaserange))) # show potential; omitted
finalphases = c()
for (i in 1:10000) {
  # run HKB and store final relative phase at iteration n
  finalphases = c(finalphases,
                  hkb(k=.1,add=(i>1),n=200,col='#00000011')[50],
                  main='k = .1 (fast movement)')
}
mtext(side=1,expression(phi),line=2)
mtext(side=2,'t (iteration)',line=2)

# k = 1.1 (slow movement)
# plot(phaserange,-cumsum(V(k=1.1,relphase=phaserange)))
finalphases = c()
for (i in 1:10000) {
  finalphases = c(finalphases,
                  hkb(k=1.1,add=(i>1),n=200,col='#00000011')[50],
                  main='k = 1.1 (slow movement)')

}
mtext(side=1,expression(phi),line=2)

dev.off()




