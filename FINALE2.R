#### NAISSA INGRID JACQUET
#### FINALE no. 2
#### MARDI, 14 JUIN 2022



#### Dans le cadre de ce devoir, nous utiliserons les donnees figurant dans le fichier excel "WB_HT_DATA".
#### Nous nous interesserons particulierement aux donnees en rapport avec l'epargne 
# de maniere a visualiser les fluctuations de l'epargne brute de 1960 A 2019.


### A-MISE EN PREPARATION

 ## A1-APPEL DES DIFFERENTES PACKAGES QUE NOUS AURONS A UTILISER:
   library(tidyverse)
   library(ggplot2) 
   library(openxlsx)

   
 ## A2-APPEL DU FICHIER:
  wbht <- read.xlsx("WB_HT_DATA.xlsx")
  wbht
  

 ## A3-EXTRACTION DES DONNEES QUE NOUS AURONS A MANIPULER:

    # SERIE CHRONOLOGIQUE EN ANNEE
Annees<-wbht[2,7:66]
Annees<-as.numeric(Annees)
Annees


### GROSS SAVINGS (% OF GDP)
Gross<-wbht[50,7:66]
Gross<-as.numeric(Gross)
Gross


### CREATION D'UNE BASE DE DONNEES
df1<- data.frame(Annees, Gross)
df1


######### B-GRAPHIQUE AVEC GGPLOT2 ###################

 #####1) GRAPHIQUE EN NUAGE DE POINTS

A <- ggplot(data = df1,
    aes( x = Annees, y = Gross, color = "RED"))+
  geom_point (size = 5, alpha = 2, fill=3)+
  labs( x="Année", y="Epargne brute")+
  ggtitle("TAUX D'EPARGNE EN POURCENTAGE DU PIB")+
  geom_smooth(method=lm,se = FALSE)
  theme_light()
A

 ###CHANGEONS LA COULEUR, LA TAILLE ET LE TYPE 
 ##Titre principal et titre des axes

A + theme( plot.title = element_text( color= "RED", size=12, face="bold.italic"),
           axis.title.x = element_text(color="blue", size=10, face="bold"),
           axis.title.y = element_text(color="blue", size=10, face="bold", vjust = 1))
  



 ##### 2) GRAPHIQUE EN BATONS


A <-ggplot(df1, aes(x= Annees, y= Gross))+
  geom_bar(stat="identity",color="black", size= 0.5, fill="orangered", width=2)+ 
  theme_classic()

A +coord_flip()



 ##### 3) GRAPHIQUE EN LIGNE

A <- ggplot(df1, aes(x=Annees, y=Gross))
labs(title= "TAUX D'EPARGNE EN POURCENTAGE DU PIB")

  ###### line plot basique avec des points
A + geom_line(aes(linetype= "dashed"), size=1, color="red")+ geom_point(color= "yellow")
  theme_classic()
  
  
  ############################## FIN ##############################
