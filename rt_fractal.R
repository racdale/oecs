#
#
# visualization of RT data as fractal / coded by Rick Dale, fall 2023
# updated spring: 2024, using Van Orden et al. 2005 data sample
# Thanks to Prof. Jay Holden for sharing this data sample
# https://doi.org/10.1037/0096-3445.134.1.117
#
# 

# load ~8,000 trial series of simple reaction time, one participant
rts = read.table('van_orden_et_al_2005.txt')$V1

# check
rts[1]
rts = rts[rts<1000] # omit a few outliers (> 1s)

#
# plot at 3 scales
#

pdf(file='rt_fractal.pdf',height=3,width=10)

layout_matrix = matrix(c(1,1,1,1,1,2,2,3),byrow = T,nrow = 1)
layout(layout_matrix)
par(oma=c(4,4,0,0),mar=c(0,0,4,2)+0.1)

ntrials=length(rts)/2 # let's go up to ~4,000 trials for illustration
scale1=1:ntrials
scale2=round(ntrials/2):ntrials
scale3=round(ntrials/2+ntrials/4):ntrials

plot(rts[scale1],lwd=1,type='l')
mtext(side=2,line=2.25,'RT (ms)')
mtext(side=1,line=2.25,'Trial number')

# color subsidiary series
rect(min(scale2),min(rts[scale2],na.rm=T),
     max(scale2),max(rts[scale2],na.rm=T),
     border='blue',col=NA,lwd=2)
rect(min(scale3),min(rts[scale3],na.rm=T),
     max(scale3),max(rts[scale3],na.rm=T),
     border='red',col=NA,lwd=2)

# plot these subsidiary series separately
plot(scale2,rts[scale2],lwd=1,type='l',col='blue')
plot(scale3,rts[scale3],lwd=1,type='l',col='red')

dev.off()




