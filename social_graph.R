library(igraph)

#
#
# social graph and degree distribution / coded by Rick Dale, fall 2023
#   this uses a sample of data from Stanford's SNAP project on social data
#   this and other sets can be found here: 
#   http://snap.stanford.edu/data/index.html#socnets
#
#

edges = read.csv('musae_ENGB_edges.csv',header=T,numerals = 'no.loss')
dim(edges)
edges[1:3,]

#
# draw graph with edges$V1 and edges$V2
#

set.seed(42)

g = graph.data.frame(edges,directed=F)
g = simplify(g) # avoid self-connections

layout = layout_with_fr(g)

pdf(file='social_graph.pdf',height=10,width=10)
plot(g,layout=layout,vertex.size=0.05,
     vertex.label=NA,vertex.color='black',
     edge.color='#00000022',edge.width=.1)
dev.off()

#
# show degree distribution log-log plot
#

g = graph.data.frame(edges,directed=F) # recover full graph
g = simplify(g) # avoid self-connections
par(bg='black')
axis()
plot(sort(degree(g),decreasing=T),log='xy',
     col='white',col.axis='white',col.lab='white',col.tick='white',
     xlab='Rank of degree (user connectivity)',ylab='Degree (number of connections)')



