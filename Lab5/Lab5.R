#' ---
#' title: "Lab 5: Data exploration and visualization"
#' author: "Weixi Chen"
#' date: "Oct 31st, 2019"
#' output: github_document
#' ---



# Lab5 Data visualization
x <- rnorm (1000)
mean(x)
sd(x)
summary(x)
boxplot(x)
hist(x)
rug(x)

# Section 2A Baby weight graph
baby <- read.table("bimm143_05_rstats/weight_chart.txt", 
                   header = TRUE)
View(baby)
plot(baby$Age, baby$Weight, type="o", pch=15, cex=1.5, lwd=2,
     ylim=c(2,10), xlab="months", ylab="kg", main="baby weight graph")

# Section 2B Mouse feature
mouse <- read.table("bimm143_05_rstats/feature_counts.txt",
                    sep="\t", header = TRUE)
# or use read.delim
View(mouse)
par(mar=c(5,11,4,8))
barplot(mouse$Count, horiz = TRUE, 
        names.arg = mouse$Feature, las=1, xlim=c(0,80000),
        main = "number of feature in mouse GRCm38 gene")

# Section 3A Gender color
gender <- read.delim("bimm143_05_rstats/male_female_counts.txt")
View(gender)
# use nrow() to find the argument for rainbow()
par(mar=c(8,5,5,2))
barplot(gender$Count, col=rainbow(nrow(gender)), 
        ylab="Count", names.arg=gender$Sample, las=2, 
        ylim=c(0,16))
# male in blue, female in red
barplot(gender$Count, col=c("blue2", "red2"), 
        ylab="Count", names.arg=gender$Sample, las=2, 
        ylim=c(0,16))

#Section 3B Gene expression
genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
View(genes)
nrow(genes)
table(genes$State)
plot(genes$Condition1, genes$Condition2, col=genes$State, 
     xlab="Expression condition 1", ylab="Expression condition 2")
#check factor with levels(genes$State)
levels(genes$State)
palette(c("red","grey","blue"))

#Section 3C Methylation expression
meth <- read.delim("bimm143_05_rstats/expression_methylation.txt")
View(meth)
nrow(meth)
#restrict to expression above 0
inds <- meth$expression > 0
plot(meth$gene.meth[inds],meth$expression[inds])
dcols <- densCols(meth$gene.meth[inds],meth$expression[inds])
plot(meth$gene.meth[inds],meth$expression[inds], 
     col=dcols, pch=20)
#give custom color
dcols.custom <- densCols(meth$gene.meth[inds],meth$expression[inds],
                         colramp = colorRampPalette(c("blue2","green2","red","yellow")))
plot(meth$gene.meth[inds],meth$expression[inds], 
     col=dcols.custom, pch=20)                         
