library(readr)
library(BsMD)
library(dae)
library(ggplot2)

setwd("Your_repository")
DataY <- read_csv("Box_Example.csv")

#Now set the column types as factors as necessary, for example, for the given Box_example dataset...
First_factor_column <- 2
Last_factor_column <- 4
DataY[,First_factor_column:Last_factor_column] <- lapply(DataY[,First_factor_column:Last_factor_column], as.factor)

#Perform Analysis of the variance on the output variable of interest 
#In the exampleof the repository, the variable of interest is "Yield". Change accordingly.
#Set the number of factors to describe interdependencies in anova. Change accordingly.

aov.test.out = aov(Yield ~.^3, data=DataY)

#Perform Yates analysis on ANOVA results and extract rounded effects with 2 precission-decimals.
Yates_eff_obj <-round(yates.effects(aov.test.out, data=DataY), 2)

#Yates effects are absolute by convention (Box et al. 1978)
Yates_eff_obj_abs <- abs(Yates_eff_obj)

#Reorder the object by effect size
Yates_eff_obj_abs<-Yates_eff_obj_abs[order(Yates_eff_obj_abs, decreasing = TRUE)]

#Get the names of the factors, just to use them correctly in the Tornado plot
Yates_eff_obj_abs_names <- names(Yates_eff_obj)

#Calculate SME and ME using BsMD and unname the object afterwards for easier maniputaliton
Lenth_data <- LenthPlot(Yates_eff_obj_abs, plt=FALSE)

Lenth_data <- unname(Lenth_data)

#Create a master dataframe to plot the results
df_Effects <- data.frame(Yates_eff_obj_abs_names, Yates_eff_obj_abs)
df_Effects <-df_Effects[order(-df_Effects$Yates_eff_obj_abs),]

#Tornado plot
assign("yates_effects", df_Effects)
ggplot(df_Effects, aes(reorder(Yates_eff_obj_abs_names,Yates_eff_obj_abs), Yates_eff_obj_abs)) + 
  geom_bar(stat = "identity", width=0.2) +coord_flip()+
  ylab("Absolute effect") +ggtitle("Tornado plot of absolute effects") + xlab("")+
  geom_hline(yintercept=Lenth_data[4], linetype="dashed", color = "red")+
  geom_hline(yintercept=Lenth_data[3], linetype="dashed", color = "red")+
  theme_bw(base_size = 12)

