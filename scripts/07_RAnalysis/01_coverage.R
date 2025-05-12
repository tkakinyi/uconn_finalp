library(tidyverse)
library(dplyr)
cov <- read.table("./bothgenome_1kb.bed.gz") 
colnames(cov) <- c("chromosome","start","end","mean","median","count")


median(cov$median)

#coverage over region
covregion <- ggplot(cov,aes(x=start,y=mean))+
  geom_point(size=0.6)

ggsave(covregion,file="covregion.png")


#coverage mean histogram
covhist <- ggplot(cov,aes(mean))+
            geom_histogram()



#GC plot
nuc <- read.table("./nuc.bed.gz", header=FALSE)
colnames(nuc) <- c("chromosome","start","end","ATpct","GCpct","A","C","G","T","N","other","length")
nuc_gc <- dplyr::mutate(nuc,excl=nuc$GCpct<0.2 )

#plot GCpct data
GCpctplot <- ggplot2::ggplot(nuc_gc,aes(x=start,y=GCpct,color=excl))+
  geom_point(size=0.2)

ggsave(GCpctplot,file="GCpctplot.png")


#end of file
