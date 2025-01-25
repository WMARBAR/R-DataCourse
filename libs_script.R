library(Rcmdr)
demo(graphics)
demo(persp)

library(rgl)
open3d()
plot3d( iris[,1:3], type="s", size=1.2, col=rainbow(3))

library(dendextend, lib.loc = "./")

demo(dendextend)

library(amap, lib.loc = "./")
demo(amap)


install.packages("DescTools", lib = "./")
library(DescTools, lib.loc = "./")
demo(DescTools)
