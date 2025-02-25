library(tidyverse)
library(rpart)
HilmanDataCSV = read.csv(url("https://raw.githubusercontent.com/dpipkin99/IS4300-Final-Project/master/HilmanData.csv"))
HD<- as.data.frame(HilmanDataCSV)

#Cleaning the Data
  #Classification
HD$Classification<-factor(HD$Classification, levels = c("Freshman", "Sophomore", "Junior","Senior","Graduate"))
  #Socio-Politico-Economic Leaning
HD$PoliticalLean <-factor(HD$PoliticalLean, levels=c("Very Liberal", "Somewhat Liberal", "Independent", "Somewhat Conservative", "Very Conservative"))
HD$SocialLean <-factor(HD$SocialLean, levels=c("Very Liberal", "Somewhat Liberal", "Independent", "Somewhat Conservative", "Very Conservative"))
HD$EconomicLean <-factor(HD$EconomicLean, levels=c("Very Liberal", "Somewhat Liberal", "Independent", "Somewhat Conservative", "Very Conservative"))
  #Initial News Opinions
HD$WaPoCredible<-factor(HD$WaPoCredible, levels=c("Strongly agree", "Somewhat agree","Somewhat disagree","Strongly disagree"))
HD$WaPoWhole<-factor(HD$WaPoWhole, levels=c("Strongly agree", "Somewhat agree","Somewhat disagree","Strongly disagree"))
HD$FoxCredible<-factor(HD$FoxCredible, levels=c("Strongly agree", "Somewhat agree","Somewhat disagree","Strongly disagree"))
HD$FoxWhole<-factor(HD$FoxWhole, levels=c("Strongly agree", "Somewhat agree","Somewhat disagree","Strongly disagree"))

    #Converting To Factor
HD$WaPoRate1<-factor(HD$WaPoRate1, levels=c("True", "Mostly True", "Mostly False", "False"))
HD$WaPoRate2<-factor(HD$WaPoRate2, levels=c("True", "Mostly True", "Mostly False", "False"))
HD$FoxRate1<-factor(HD$FoxRate1, levels=c("True", "Mostly True", "Mostly False", "False"))
HD$FoxRate2<-factor(HD$FoxRate2, levels=c("True", "Mostly True", "Mostly False", "False"))

  #Washington Post Question 1
HD$WaPoCheckOther1 <- factor(HD$WaPoCheckOther1, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$WaPoAskOthers1 <- factor(HD$WaPoAskOthers1, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$WaPoSocialMed1 <- factor(HD$WaPoSocialMed1, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$WaPoSearchOnline1 <- factor(HD$WaPoSearchOnline1, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$WaPoOtherSource1 <- factor(HD$WaPoOtherSource1,levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
  #Washington Post Question 2
HD$WaPoCheckOther2 <- factor(HD$WaPoCheckOther2, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$WaPoAskOthers2 <- factor(HD$WaPoAskOthers2, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$WaPoSocialMed2 <- factor(HD$WaPoSocialMed2, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$WaPoSearchOnline2 <- factor(HD$WaPoSearchOnline2, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$WaPoOtherSource2 <- factor(HD$WaPoOtherSource2,levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
  #Fox News Question 1
HD$FoxCheckOther1 <- factor(HD$FoxCheckOther1, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$FoxAskOthers1 <- factor(HD$FoxAskOthers1, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$FoxSocialMedia1 <- factor(HD$FoxSocialMedia1, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$FoxSearchOnline1 <- factor(HD$FoxSearchOnline1, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$FoxOtherSource1 <- factor(HD$FoxOtherSource1,levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
  #Fox News Question 2
HD$FoxCheckOther2 <- factor(HD$FoxCheckOther2, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$FoxAskOthers2 <- factor(HD$FoxAskOthers2, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$FoxSocialMedia2 <- factor(HD$FoxSocialMedia2, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$FoxSearchOnline2 <- factor(HD$FoxSearchOnline2, levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"))
HD$FoxOtherSource2 <- factor(HD$FoxOtherSource2,levels= c("Very Likely","Somewhat Likely", "Somewhat Unlikely", "Very Unlikely"));



  #Statistics
#Generating a general feel for the overall lean of the respondents
#With 1 being very liberal, 5 being very conservative, and 3 being more independent.
meanPolitical = mean(as.numeric(HD$PoliticalLean))
meanSocial = mean(as.numeric(HD$SocialLean))
meanEconomical = mean(as.numeric(HD$EconomicLean))
#Creating an aggregate lean
overallMean = ((meanPolitical+meanSocial+meanEconomical)/3)
#Overall mean is 3.48. Slight lean conservative.
#Creating individual means for each student
HD<-HD %>% mutate(indivMean = (as.numeric(PoliticalLean)+as.numeric(SocialLean)+as.numeric(EconomicLean))/3)
#Seperating into generally conservative and generally liberal
HDCon<-HD%>%filter(indivMean>3.5)
HDLib<-HD%>%filter(indivMean<2.5)

HDPlot <- HD%>%ggplot()
HDPlotCon <- HDCon%>%ggplot()
HDPlotLib <- HDLib%>%ggplot()

##WORKSPACE:



















