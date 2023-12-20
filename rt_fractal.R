#
#
# visualization of RT data as fractal / coded by Rick Dale, fall 2023
#    data from Mahmoodi et al. (2023). Brain and Behavior, 13(7), e3069.
#    https://doi.org/10.1002/brb3.3069
#
#

rts = read.csv('https://raw.githubusercontent.com/Korosh137/DFA-RT/main/complete_behavior_SK.csv')

# check
rts[1,]

# get 1 subject
sub20 = rts[rts$SID==20,]

#
# plot at 3 scales
#

pdf(file='rt_fractal.pdf',height=3,width=10)

layout_matrix = matrix(c(1,1,1,1,1,2,2,3),byrow = T,nrow = 1)
layout(layout_matrix)
par(oma=c(4,4,0,0),mar=c(0,0,4,2)+0.1)

ntrials=nrow(sub20)
scale1=1:ntrials
scale2=round(ntrials/2):ntrials
scale3=round(ntrials/2+ntrials/4):ntrials

plot(sub20$RT[scale1],lwd=1,type='l')
mtext(side=2,line=2.25,'RT (ms)')
mtext(side=1,line=2.25,'Trial number')

# color subsidiary series
rect(min(scale2),min(sub20$RT[scale2],na.rm=T),
     max(scale2),max(sub20$RT[scale2],na.rm=T),
     border='blue',col=NA,lwd=2)
rect(min(scale3),min(sub20$RT[scale3],na.rm=T),
     max(scale3),max(sub20$RT[scale3],na.rm=T),
     border='red',col=NA,lwd=2)

# plot these subsidiary series separately
plot(scale2,sub20$RT[scale2],lwd=1,type='l',col='blue')
plot(scale3,sub20$RT[scale3],lwd=1,type='l',col='red')

dev.off()




