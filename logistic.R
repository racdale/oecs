
#
#
# illustration of logistic map's behavior / coded by Rick Dale, fall 2023
#   for discussion of this simple model's theoretical implications, see:
#   Mitchell (2009) Complexity: A Guided Tour 
#   https://global.oup.com/academic/product/complexity-9780199798100
#
#

logistic_map = function(r=2,n=50,xs=runif(1),add=FALSE,col='black',plotit=TRUE,showy=TRUE,showx=TRUE) {
  
  # iterate over logistic difference equation
  for (i in 1:(n-1)) {
    xs = c(xs, r*xs[i]*(1-xs[i]))
  }
  
  # superimpose if desired; for just model, set plotit = FALSE
  if (add & plotit) { 
    points(xs,type='l',lwd=2,col=col)
  } else if (plotit) {
    plot(xs,type='l',lwd=2,ylim=c(0,1),
         xlab='t (iteration)',ylab='x_t',col=col)
    title(main=paste('r =',r),line=0.5)
    if (showx) {mtext('t',side=1,line=2,cex=.8)}
    if (showy) {mtext('x',side=2,line=2,cex=.8)}
  }
  
  return(xs)
}
 
set.seed(42) # recreate exact plot from entry

pdf(file='logistic.pdf',height=7,width=7)

layout_matrix = matrix(c(1,2,3,4,5,5,5,5),byrow = T,nrow = 4)
layout(layout_matrix)

par(oma=c(4,4,0,0),mar=c(0,0,4,2)+0.1)

#
# top 2 x 2 panels
#

logistic_map(2.9,50,col='blue',showx=F)
logistic_map(3.1,50,col='orange',showy=F,showx=F)
logistic_map(3.7,50,col='red')

# illustration of chaos/sensitive dependence
logistic_map(3.7,50,xs=.5,col='gray',showy=F)
logistic_map(3.7,50,xs=.5001,add=T,col='black',showy=F,showx=F)

#
# recreate full regimes of the map
#

data = c()
last_x = .51
rs = seq(from=2.8,to=4,length=20000)

for (r in rs) {
  print(which(rs==r)/length(rs))  
  maprun = logistic_map(r,100,xs=last_x,plotit=F)
  data = rbind(data,data.frame(r=r,x=maprun[50:100]))
  last_x = maprun[100]
}

plot(data$r,data$x,type='p',cex=.005,xlab='r',ylab='x_t',bty='n',col='#00000011')
mtext('r',side=1,line=2,cex=1)
mtext('x',side=2,line=2,cex=1)

points(c(2.9,2.9),c(-1,2),type='l',lwd=2,col='blue')
points(c(3.1,3.1),c(-1,2),type='l',lwd=2,col='orange')
points(c(3.7,3.7),c(-1,2),type='l',lwd=2,col='red')

dev.off()


