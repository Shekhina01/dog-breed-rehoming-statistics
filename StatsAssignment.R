#set working directory and load file
setwd("C:/Users/user/Desktop/DATA SCIENCE & ANALYTICS/STATISTICAL THOERY AND METHODS")
load(file = "rehoming.Rdata")
#create sample data
createsample(201740454)
#save the generated data
save(mysample, file = "mysamples.RData")
#to check breeds included
table(mysample$Breed)
#to view the generated data
nrow(mysample)
#clean the rehomed data
mysample$Rehomed
sort(mysample$Rehomed)
sum(mysample$Rehomed==99999)
mysample[mysample$Rehomed==99999, ]
#remove all rows containing missing values that are recorded as 99999
mysample2 <- mysample[-c(31, 37, 84, 119, 157, 194, 221, 232, 255), ]
nrow(mysample2)
mysample2[mysample2$Rehomed==99999, ]
#to view breeds
mysample2
sort(mysample2$Breed)
mysample2<-mysample2[!is.na(mysample2$Breed) , ]
mysample2
nrow(mysample2)
------------
#Numerical summary of different breeds
border_collie<- mysample2[mysample2$Breed == "Border Collie", ]
border_collie$Rehomed
border_collie_sum<-summary(border_collie)
print(border_collie_sum)

shih_tzu<- mysample2[mysample2$Breed == "Shih Tzu", ]
shih_tzu$Rehomed
shih_tzu_sum<-summary(shih_tzu)
print(shih_tzu_sum)

staffordshire_bull<- mysample2[mysample2$Breed == "Staffordshire Bull Terrier", ]
staffordshire_bull$Rehomed
staffordshire_bull_sum<-summary(staffordshire_bull)
print(staffordshire_bull_sum)  

border_collie <- na.omit(border_collie)
shih_tzu <- na.omit(shih_tzu)
staffordshire_bull <- na.omit(staffordshire_bull)

sd(border_collie$Health)
sd(shih_tzu$Health)
sd(staffordshire_bull$Health)

sd(border_collie$Visited)
sd(shih_tzu$Visited)
sd(staffordshire_bull$Visited)

#Graphical summary of different breeds

par(mfrow = c(1, 3))
boxplot(border_collie$Rehomed, main = "Border Collie", col = "lightblue")
boxplot(shih_tzu$Rehomed, main = "Shih Tzu", col = "lightyellow")
boxplot(staffordshire_bull$Rehomed, main = "Staffordshire Bull Terrier", col = "lightpink")

# QQ plot 
par(mfrow = c(1, 3))
qqnorm(border_collie$Rehomed)
qqline(border_collie$Rehomed, col = "blue", lwd=2)
qqnorm(shih_tzu$Rehomed)
qqline(shih_tzu$Rehomed, col = "darkgreen", lwd=2)
qqnorm(staffordshire_bull$Rehomed)
qqline(staffordshire_bull$Rehomed, col = "red", lwd=2)

par(mfrow = c(1, 3))

# Histogram with Density Curve
hist(border_collie$Rehomed, main = "Border Collie", col = "lightblue", probability = TRUE)
lines(density(border_collie$Rehomed), col = "blue", lwd = 2)
hist(shih_tzu$Rehomed, main = "Shih Tzu", col = "lightyellow", probability = TRUE)
lines(density(shih_tzu$Rehomed), col = "orange", lwd = 2)
hist(staffordshire_bull$Rehomed, main = "Staffordshire Bull Terrier", col = "lightpink", probability = TRUE)
lines(density(staffordshire_bull$Rehomed), col = "red", lwd = 2)

#Modelling and testing
#BC 
border_collie$Rehomed
mean(border_collie$Rehomed)
sd(border_collie$Rehomed)
hist(border_collie$Rehomed, main = "Border Collie", col = "lightblue", xlab = "Rehomed Time", ylab = "Frequency", freq =  FALSE)
x <- seq(from = min(border_collie$Rehomed), to = max(border_collie$Rehomed), by = 0.1)
lines(x, dnorm(x, mean = 21.51, sd = 11.98), lwd = 2, col = "blue")
# Shapiro-Wilk test for normality
shapiro.test(border_collie$Rehomed)
#ks test for normality
ks.test(border_collie$Rehomed, "pnorm", mean = 21.51, sd = 11.98)

#ST - Normal distribution
shih_tzu$Rehomed
mean(shih_tzu$Rehomed)
sd(shih_tzu$Rehomed)
hist(shih_tzu$Rehomed, main = "Shih Tzu", col = "lightyellow", xlab = "Rehomed Time", ylab = "Frequency", freq = FALSE)
x <- seq(from = min(shih_tzu$Rehomed), to = max(shih_tzu$Rehomed), by = 0.1)
lines(x, dnorm(x, mean = 19.5, sd = 8.826), lwd = 2, col = "darkgreen")
#Shapiro test for normality
shapiro.test(shih_tzu$Rehomed)
#ks test for normality
ks.test(shih_tzu$Rehomed, "pnorm", mean = 19.5, sd=8.826)

#SBD - Exponential distribution
staffordshire_bull$Rehomed
mean(staffordshire_bull$Rehomed)
sd(staffordshire_bull$Rehomed)
hist(staffordshire_bull$Rehomed, main = "Staffordshire Bull Terrier", col = "lightpink", xlab = "Rehomed Time", ylab = "Frequency", freq =  FALSE)
x <- seq(from = min(staffordshire_bull$Rehomed), to = max(staffordshire_bull$Rehomed), by = 0.1)
lines(x, dnorm(x, mean = 19.17, sd = 10.55), lwd = 2, col = "black")
lines(x, pexp(x, rate=1/19.17), lwd = 2, col = "orange")
#shapiro test for normality
shapiro.test(staffordshire_bull$Rehomed)
#Ks test for normality
ks.test(staffordshire_bull$Rehomed, "pnorm", mean = 19.172, sd = 10.55)
#Ks test for normality
ks.test(staffordshire_bull$Rehomed, "pexp", rate = 1/19.172)

------
#Z- Test for border collie as n>30 
BC_Z_test <- (20.47436 - 27) / (11.87349 / sqrt(length(border_collie$Rehomed)))
BC_Z_test
z_statistic <- -4.85  
df <- 77              
p_value <- 2 * pnorm(z_statistic, lower.tail = TRUE)
p_value

#T-Test for Shih Tzus as n<30
ST_CI <- t.test(shih_tzu$Rehomed, mu = 27, conf.level = 0.95)$conf.int
ST_P_value <- t.test(shih_tzu$Rehomed, mu = 27)$p.value
ST_CI
ST_P_value

#T-Test for Staffordshire Bull Terriers
SB_CI <- t.test(staffordshire_bull$Rehomed, mu = 27, conf.level = 0.95)$conf.int
SB_P_value <- t.test(staffordshire_bull$Rehomed, mu = 27)$p.value
SB_CI
SB_P_value

-------
  
#Confidence Interval and Two-Sample t-Test 
#Border Collies and Shih Tzus
Test1 <- t.test(border_collie$Rehomed, shih_tzu$Rehomed, conf.level = 0.95)$conf.int
Test1

#Border Collies and Staffordshire Bull Terriers
Test2 <- t.test(border_collie$Rehomed, staffordshire_bull$Rehomed, conf.level = 0.95)$conf.int
Test2

#Shih Tzus and Staffordshire Bull Terriers
Test3 <- t.test(shih_tzu$Rehomed, staffordshire_bull$Rehomed, conf.level = 0.95)$conf.int
Test3


# Extracting and displaying rehoming time data for Shih Tzus
shih_tzu$Rehomed
mean_val <- mean(shih_tzu$Rehomed)
sd_val <- sd(shih_tzu$Rehomed)

