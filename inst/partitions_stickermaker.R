library("hexSticker")

bmp(file="partitions_icon.bmp",bg="#7733FF",width=2000,height=1500)
par(mar=c(5,2,4,2)+0)
par(pty="s")
plot(NA,xlim=c(0,7),ylim=c(0,4),asp=1,axes=FALSE,xlab='',ylab='')
points(rbind(
    cbind(c(1,2,3,4,5,6),4),
    cbind(c(1,2,3,4)    ,3),
    cbind(c(1,2,3,4)    ,2),
    cbind(c(1)          ,1)
) ,pch=16,cex=25)
dev.off()

sticker("partitions_icon.bmp", package="partitions", p_size=28, s_x=1, s_y=0.64,
s_width=0.9,asp=sqrt(3)/2, white_around_sticker=TRUE, h_fill="#7733FF",
h_color="#000000", filename="partitions.png")
