library(tidyverse)
library(raster)

maskara<-raster::raster("G:/Mi unidad/CONABIO/Mascaras/malla_1kmPR_g.tif")

#Variabes Presente####
presente<-raster:::stack(list.files("G:/Mi unidad/COBERTURAS/wc2.1_30s/wc2.1_2.5m_bio/Current/",full.names = T, pattern=".tif$")) 
presente<-raster::crop(presente, maskara)
x.stats.0 <- data.frame(x.mean=cellStats(presente, "mean")) %>% mutate("GCM" = "Baseline")%>% mutate("Delta" = "meanBaseline") 
write.csv(x.stats.0, "C:/COBERTURAS/MeanBio_Presente.csv")

#Variables Futuro#####
ACCESS.CM2<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_ACCESS-CM2_ssp245_2041_2060.tif"),maskara) #1
ACCESS.ESM1.5<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_ACCESS-ESM1-5_ssp245_2041_2060.tif"),maskara) #2
#BCC.CSM2.MR<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_BCC-CSM2-MR_ssp245_2041_2060.tif"),maskara)#3
CanESM5<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_CanESM5_ssp245_2041-2060.tif"),maskara)#4
CanESM5.CanOE<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_CanESM5-CanOE_ssp245_2041_2060.tif"),maskara)#5
CMCC.ESM2<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_CMCC-ESM2_ssp245_2041_2060.tif"),maskara)#6
CNRM.CM6.1<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_CNRM-CM6-1_ssp245_2041_2060.tif"),maskara)#7
CNRM.CM6.1.HR<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_CNRM-CM6-1-HR_ssp245_2041_2060.tif"),maskara)#8
CNRM.ESM2.1<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_CNRM-ESM2-1_ssp245_2041_2060.tif"),maskara)#9
EC.Earth3.Veg<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_EC-Earth3-Veg_ssp245_2041_2060.tif"),maskara)#10
EC.Earth3.Veg.LR<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_EC-Earth3-Veg-LR_ssp245_2041_2060.tif"),maskara)#11
FIO.ESM.2.0<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_FIO-ESM-2-0_ssp245_2041_2060.tif"),maskara)#12
GISS.E2.1.G<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_GISS-E2-1-G_ssp245_2041_2060.tif"),maskara)#13
GISS.E2.1.H<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_GISS-E2-1-H_ssp245_2041_2060.tif"),maskara)#14
INM.CM4.8<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_INM-CM4-8_ssp245_2041_2060.tif"),maskara)#15
INM.CM5.0<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_INM-CM5-0_ssp245_2041_2060.tif"),maskara)#16
IPSL.CM6A.LR<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_IPSL-CM6A-LR_ssp245_2041_2060.tif"),maskara)#17
MIROC6<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_MIROC6_ssp245_2041_2060.tif"),maskara)#18
MIROC.ES2L<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_MIROC-ES2L_ssp245_2041_2060.tif"),maskara)#19
MPI.ESM1.2.HR<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_MPI-ESM1-2-HR_ssp245_2041_2060.tif"),maskara)#20
MPI.ESM1.2.LR<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_MPI-ESM1-2-LR_ssp245_2041_2060.tif"),maskara)#21
MRI.ESM2.0<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_MRI-ESM2-0_ssp245_2041_2060.tif"),maskara)#22
UKESM1.0.LL<-raster::crop(raster::stack("C:/COBERTURAS/WC_CMIP6/wc2.1_2.5m_bioc_UKESM1-0-LL_ssp245_2041_2060.tif"),maskara)#23

#Tabla
x.stats.1 <- data.frame(x.mean=cellStats(ACCESS.CM2, "mean")) %>% mutate("GCM" = "ACCESS.CM2")%>% mutate("Delta" = "meanFuture") %>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.2 <- data.frame(x.mean=cellStats(ACCESS.ESM1.5, "mean")) %>% mutate("GCM" = "ACCESS.ESM1.5")%>% mutate("Delta" = "meanFuture") %>% mutate("Variable"=paste("wc2_",seq(1:19)))
#x.stats.3 <- data.frame(x.mean=cellStats(BCC.CSM2.MR, "mean")) %>% mutate("GCM" = "BCC.CSM2.MR")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.4 <- data.frame(x.mean=cellStats(CanESM5, "mean")) %>% mutate("GCM" = "CanESM5")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.5 <- data.frame(x.mean=cellStats(CanESM5.CanOE, "mean")) %>% mutate("GCM" = "CanESM5.CanOE")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.6 <- data.frame(x.mean=cellStats(CMCC.ESM2, "mean")) %>% mutate("GCM" = "CMCC.ESM2")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.7 <- data.frame(x.mean=cellStats(CNRM.CM6.1, "mean")) %>% mutate("GCM" = "CNRM.CM6.1")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.8 <- data.frame(x.mean=cellStats(CNRM.CM6.1.HR, "mean")) %>% mutate("GCM" = "CNRM.CM6.1.HR")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.9 <- data.frame(x.mean=cellStats(CNRM.ESM2.1, "mean")) %>% mutate("GCM" = "CNRM.ESM2.1")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.10 <- data.frame(x.mean=cellStats(EC.Earth3.Veg, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.11 <- data.frame(x.mean=cellStats(EC.Earth3.Veg.LR, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg.LR")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.12 <- data.frame(x.mean=cellStats(FIO.ESM.2.0, "mean")) %>% mutate("GCM" = "FIO.ESM.2.0")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.13 <- data.frame(x.mean=cellStats(GISS.E2.1.G, "mean")) %>% mutate("GCM" = "GISS.E2.1.G")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.14 <- data.frame(x.mean=cellStats(GISS.E2.1.H, "mean")) %>% mutate("GCM" = "GISS.E2.1.H")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.15 <- data.frame(x.mean=cellStats(INM.CM4.8, "mean")) %>% mutate("GCM" = "INM.CM4.8")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.16 <- data.frame(x.mean=cellStats(INM.CM5.0, "mean")) %>% mutate("GCM" = "INM.CM5.0")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.17 <- data.frame(x.mean=cellStats(IPSL.CM6A.LR, "mean")) %>% mutate("GCM" = "IPSL.CM6A.LR")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.18 <- data.frame(x.mean=cellStats(MIROC6, "mean")) %>% mutate("GCM" = "MIROC6")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.19 <- data.frame(x.mean=cellStats(MIROC.ES2L, "mean")) %>% mutate("GCM" = "MIROC.ES2L")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.20 <- data.frame(x.mean=cellStats(MPI.ESM1.2.HR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2.HR")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.21 <- data.frame(x.mean=cellStats(MPI.ESM1.2.LR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2.LR")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.22 <- data.frame(x.mean=cellStats(MRI.ESM2.0, "mean")) %>% mutate("GCM" = "MRI.ESM2.0")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))
x.stats.23 <- data.frame(x.mean=cellStats(UKESM1.0.LL, "mean")) %>% mutate("GCM" = "UKESM1.0.LL")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

tabla_p<-rbind(x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23)
View(tabla_p)

write.csv(tabla_p, "C:/COBERTURAS/MeanBio_GCMyPresente.csv")

rm(x.stats.0,x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23)


#Diferencias del futuro al presente, todos los bios####
d.ACCESS.CM2<-ACCESS.CM2-presente 
x.stats.1 <- data.frame(x.mean=scale(cellStats(d.ACCESS.CM2, "mean"))) %>% mutate("GCM" = "ACCESS.CM2")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.ACCESS.ESM1<-ACCESS.ESM1.5-presente
x.stats.2 <- data.frame(x.mean=scale(cellStats(d.ACCESS.ESM1, "mean"))) %>% mutate("GCM" = "ACCESS.ESM1.5")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

#d.BCC.CSM2.MR<-BCC.CSM2.MR-presente
#x.stats.3 <- data.frame(x.mean=scale(cellStats(d.BCC.CSM2.MR, "mean"))) %>% mutate("GCM" = "BCC.CSM2.MR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CanESM5<-CanESM5-presente
x.stats.4 <- data.frame(x.mean=scale(cellStats(d.CanESM5,"mean"))) %>% mutate("GCM" = "CanESM5.5")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CanESM5.CanOE<-CanESM5.CanOE-presente
x.stats.5 <- data.frame(x.mean=scale(cellStats(d.CanESM5.CanOE, "mean"))) %>% mutate("GCM" = "CanESM5.CanOE.5")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CMCC.ESM2<-CMCC.ESM2-presente
x.stats.6 <- data.frame(x.mean=scale(cellStats(d.CMCC.ESM2, "mean"))) %>% mutate("GCM" = "CMCC.ESM2.5")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CNRM.CM6.1<- CNRM.CM6.1-presente
x.stats.7 <- data.frame(x.mean=scale(cellStats(d.CNRM.CM6.1, "mean"))) %>% mutate("GCM" = "CNRM.CM6.1")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CNRM.CM6.1.HR<-CNRM.CM6.1.HR-presente
x.stats.8 <- data.frame(x.mean=scale(cellStats(d.CNRM.CM6.1.HR, "mean"))) %>% mutate("GCM" = "CNRM.CM6.1.HR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CNRM.ESM2.1<-CNRM.ESM2.1-presente
x.stats.9 <- data.frame(x.mean=scale(cellStats(d.CNRM.ESM2.1, "mean"))) %>% mutate("GCM" = "CNRM.ESM2.1")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.EC.Earth3.Veg<-EC.Earth3.Veg-presente
x.stats.10 <- data.frame(x.mean=scale(cellStats(d.EC.Earth3.Veg, "mean"))) %>% mutate("GCM" = "EC.Earth3.Veg")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.EC.Earth3.Veg.LR<-EC.Earth3.Veg.LR-presente
x.stats.11 <- data.frame(x.mean=scale(cellStats(d.EC.Earth3.Veg.LR, "mean"))) %>% mutate("GCM" = "EC.Earth3.Veg.LR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.FIO.ESM.2.0<-FIO.ESM.2.0-presente
x.stats.12 <- data.frame(x.mean=scale(cellStats(d.FIO.ESM.2.0, "mean"))) %>% mutate("GCM" = "FIO.ESM.2.0")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.GISS.E2.1.G<-GISS.E2.1.G-presente
x.stats.13 <- data.frame(x.mean=scale(cellStats(d.GISS.E2.1.G, "mean"))) %>% mutate("GCM" = "GISS.E2.1.G")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.GISS.E2.1.H<-GISS.E2.1.H-presente
x.stats.14 <- data.frame(x.mean=scale(cellStats(d.GISS.E2.1.H, "mean"))) %>% mutate("GCM" = "GISS.E2.1.H")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.INM.CM4.8<-INM.CM4.8-presente
x.stats.15 <- data.frame(x.mean=scale(cellStats(d.INM.CM4.8, "mean"))) %>% mutate("GCM" = "INM.CM4.8")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.INM.CM5.0<-INM.CM5.0-presente
x.stats.16 <- data.frame(x.mean=scale(cellStats(d.INM.CM5.0, "mean"))) %>% mutate("GCM" = "INM.CM5.0")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.IPSL.CM6A.LR<-IPSL.CM6A.LR-presente
x.stats.17 <- data.frame(x.mean=scale(cellStats(d.IPSL.CM6A.LR, "mean"))) %>% mutate("GCM" = "IPSL.CM6A.LR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MIROC6<-MIROC6-presente
x.stats.18 <- data.frame(x.mean=scale(cellStats(d.MIROC6, "mean"))) %>% mutate("GCM" = "MIROC6")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MIROC.ES2L<-MIROC.ES2L-presente
x.stats.19 <- data.frame(x.mean=scale(cellStats(d.MIROC.ES2L, "mean"))) %>% mutate("GCM" = "MIROC.ES2L")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MPI.ESM1.2.HR<-MPI.ESM1.2.HR-presente
x.stats.20 <- data.frame(x.mean=scale(cellStats(d.MPI.ESM1.2.HR, "mean"))) %>% mutate("GCM" = "MPI.ESM1.2.HR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MPI.ESM1.2.LR<-MPI.ESM1.2.LR-presente
x.stats.21 <- data.frame(x.mean=scale(cellStats(d.MPI.ESM1.2.LR, "mean"))) %>% mutate("GCM" = "MPI.ESM1.2")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MRI.ESM2.0<-MRI.ESM2.0-presente
x.stats.22 <- data.frame(x.mean=scale(cellStats(d.MRI.ESM2.0, "mean"))) %>% mutate("GCM" = "MRI.ESM2.0")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.UKESM1.0.LL<-UKESM1.0.LL-presente
x.stats.23 <- data.frame(x.mean=scale(cellStats(d.UKESM1.0.LL, "mean"))) %>% mutate("GCM" = "UKESM1.0.LL")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

#Hay que incluir x.stats.3,

Bio_from_p<-rbind(x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23)
View(Bio_from_p)

write.csv(Bio_from_p, "C:/COBERTURAS/dPresente_scale.csv")

rm(x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23)

rm(d.ACCESS.CM2,d.ACCESS.ESM1,d.BCC.CSM2.MR,d.CanESM5,d.CanESM5.CanOE,d.CMCC.ESM2,d.CNRM.CM6.1,d.CNRM.CM6.1.HR,d.CNRM.ESM2.1,d.EC.Earth3.Veg,d.EC.Earth3.Veg.LR,d.FIO.ESM.2.0,d.GISS.E2.1.G,d.GISS.E2.1.H,d.INM.CM4.8,d.INM.CM5.0,d.IPSL.CM6A.LR,d.MIROC6,d.MIROC.ES2L,d.MPI.ESM1.2.HR,d.MPI.ESM1.2.LR,d.MRI.ESM2.0,d.UKESM1.0.LL)


#Delta ensemble####
#bio1####
#Para hacer el raster de la media de todos
ens_bio01_GCMs<-(ACCESS.CM2[[1]]+ ACCESS.ESM1.5[[1]]+ CanESM5[[1]]+CanESM5.CanOE[[1]]+ CMCC.ESM2[[1]]+CNRM.CM6.1[[1]]+CNRM.CM6.1.HR[[1]]+ CNRM.ESM2.1[[1]]+ EC.Earth3.Veg[[1]]+ EC.Earth3.Veg.LR[[1]]+ FIO.ESM.2.0[[1]]+ GISS.E2.1.G[[1]]+ GISS.E2.1.H[[1]]+ INM.CM4.8[[1]]+ INM.CM5.0[[1]]+IPSL.CM6A.LR[[1]]+MIROC6[[1]]+ MIROC.ES2L[[1]]+ MIROC.ES2L[[1]]+ MPI.ESM1.2.HR[[1]]+MPI.ESM1.2.LR[[1]]+ MRI.ESM2.0[[1]]+UKESM1.0.LL[[1]]) #borr? BCC.CSM2.MR[[1]]+

ens_bio01_GCM<-ens_bio01_GCMs/22 #Son 23 con el de BCC, pero entonces toca meterlo desde el inicio

#Ahora si a la media de todos se le resta cada uno de los GCM
x.stats.0 <- data.frame(x.mean=cellStats(ens_bio01_GCM, "mean")) %>% mutate("GCM" = "Ensemble")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.ACCESS.CM2<-ACCESS.CM2[[1]]-ens_bio01_GCM
x.stats.1 <- data.frame(x.mean=cellStats(d.ACCESS.CM2, "mean")) %>% mutate("GCM" = "ACCESS.CM2")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.ACCESS.ESM1<-ACCESS.ESM1.5[[1]]-ens_bio01_GCM
x.stats.2 <- data.frame(x.mean=cellStats(d.ACCESS.ESM1, "mean")) %>% mutate("GCM" = "ACCESS.ESM1.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

#d.BCC.CSM2.MR<-BCC.CSM2.MR[[1]]-ens_bio01_GCM
#x.stats.3 <- data.frame(x.mean=cellStats(d.BCC.CSM2.MR, "mean"))) %>% mutate("GCM" = "BCC.CSM2.MR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.CanESM5<-CanESM5[[1]]-ens_bio01_GCM
x.stats.4 <- data.frame(x.mean=cellStats(d.CanESM5,"mean")) %>% mutate("GCM" = "CanESM5.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.CanESM5.CanOE<-CanESM5.CanOE[[1]]-ens_bio01_GCM
x.stats.5 <- data.frame(x.mean=cellStats(d.CanESM5.CanOE, "mean")) %>% mutate("GCM" = "CanESM5.CanOE.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.CMCC.ESM2<-CMCC.ESM2[[1]]-ens_bio01_GCM
x.stats.6 <- data.frame(x.mean=cellStats(d.CMCC.ESM2, "mean")) %>% mutate("GCM" = "CMCC.ESM2.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.CNRM.CM6.1<- CNRM.CM6.1[[1]]-ens_bio01_GCM
x.stats.7 <- data.frame(x.mean=cellStats(d.CNRM.CM6.1, "mean")) %>% mutate("GCM" = "CNRM.CM6.1")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.CNRM.CM6.1.HR<-CNRM.CM6.1.HR[[1]]-ens_bio01_GCM
x.stats.8 <- data.frame(x.mean=cellStats(d.CNRM.CM6.1.HR, "mean")) %>% mutate("GCM" = "CNRM.CM6.1.HR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.CNRM.ESM2.1<-CNRM.ESM2.1[[1]]-ens_bio01_GCM
x.stats.9 <- data.frame(x.mean=cellStats(d.CNRM.ESM2.1, "mean")) %>% mutate("GCM" = "CNRM.ESM2.1")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.EC.Earth3.Veg<-EC.Earth3.Veg[[1]]-ens_bio01_GCM
x.stats.10 <- data.frame(x.mean=cellStats(d.EC.Earth3.Veg, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.EC.Earth3.Veg.LR<-EC.Earth3.Veg.LR[[1]]-ens_bio01_GCM
x.stats.11 <- data.frame(x.mean=cellStats(d.EC.Earth3.Veg.LR, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg.LR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.FIO.ESM.2.0<-FIO.ESM.2.0[[1]]-ens_bio01_GCM
x.stats.12 <- data.frame(x.mean=cellStats(d.FIO.ESM.2.0, "mean")) %>% mutate("GCM" = "FIO.ESM.2.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.GISS.E2.1.G<-GISS.E2.1.G[[1]]-ens_bio01_GCM
x.stats.13 <- data.frame(x.mean=cellStats(d.GISS.E2.1.G, "mean")) %>% mutate("GCM" = "GISS.E2.1.G")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.GISS.E2.1.H<-GISS.E2.1.H[[1]]-ens_bio01_GCM
x.stats.14 <- data.frame(x.mean=cellStats(d.GISS.E2.1.H, "mean")) %>% mutate("GCM" = "GISS.E2.1.H")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.INM.CM4.8<-INM.CM4.8[[1]]-ens_bio01_GCM
x.stats.15 <- data.frame(x.mean=cellStats(d.INM.CM4.8, "mean")) %>% mutate("GCM" = "INM.CM4.8")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.INM.CM5.0<-INM.CM5.0[[1]]-ens_bio01_GCM
x.stats.16 <- data.frame(x.mean=cellStats(d.INM.CM5.0, "mean")) %>% mutate("GCM" = "INM.CM5.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.IPSL.CM6A.LR<-IPSL.CM6A.LR[[1]]-ens_bio01_GCM
x.stats.17 <- data.frame(x.mean=cellStats(d.IPSL.CM6A.LR, "mean")) %>% mutate("GCM" = "IPSL.CM6A.LR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.MIROC6<-MIROC6[[1]]-ens_bio01_GCM
x.stats.18 <- data.frame(x.mean=cellStats(d.MIROC6, "mean")) %>% mutate("GCM" = "MIROC6")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.MIROC.ES2L<-MIROC.ES2L[[1]]-ens_bio01_GCM
x.stats.19 <- data.frame(x.mean=cellStats(d.MIROC.ES2L, "mean")) %>% mutate("GCM" = "MIROC.ES2L")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.MPI.ESM1.2.HR<-MPI.ESM1.2.HR[[1]]-ens_bio01_GCM
x.stats.20 <- data.frame(x.mean=cellStats(d.MPI.ESM1.2.HR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2.HR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.MPI.ESM1.2.LR<-MPI.ESM1.2.LR[[1]]-ens_bio01_GCM
x.stats.21 <- data.frame(x.mean=cellStats(d.MPI.ESM1.2.LR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.MRI.ESM2.0<-MRI.ESM2.0[[1]]-ens_bio01_GCM
x.stats.22 <- data.frame(x.mean=cellStats(d.MRI.ESM2.0, "mean")) %>% mutate("GCM" = "MRI.ESM2.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.UKESM1.0.LL<-UKESM1.0.LL[[1]]-ens_bio01_GCM
x.stats.23 <- data.frame(x.mean=cellStats(d.UKESM1.0.LL, "mean")) %>% mutate("GCM" = "UKESM1.0.LL")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

Bio01_between_GCM<-rbind(x.stats.0,x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23)#x.stats.3, sin
View(Bio01_between_GCM)

write.csv(Bio01_between_GCM, "C:/COBERTURAS/Bio01_between_GCM.csv")

rm(x.stats.0,x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23)

rm(d.ACCESS.CM2,d.ACCESS.ESM1,d.BCC.CSM2.MR,d.CanESM5,d.CanESM5.CanOE,d.CMCC.ESM2,d.CNRM.CM6.1,d.CNRM.CM6.1.HR,d.CNRM.ESM2.1,d.EC.Earth3.Veg,d.EC.Earth3.Veg.LR,d.FIO.ESM.2.0,d.GISS.E2.1.G,d.GISS.E2.1.H,d.INM.CM4.8,d.INM.CM5.0,d.IPSL.CM6A.LR,d.MIROC6,d.MIROC.ES2L,d.MPI.ESM1.2.HR,d.MPI.ESM1.2.LR,d.MRI.ESM2.0,d.UKESM1.0.LL)

#bio12####
ens_bio12_GCMs<-(ACCESS.CM2[[12]]+ ACCESS.ESM1.5[[12]]+ CanESM5[[12]]+CanESM5.CanOE[[12]]+ CMCC.ESM2[[12]]+CNRM.CM6.1[[12]]+CNRM.CM6.1.HR[[12]]+ CNRM.ESM2.1[[12]]+ EC.Earth3.Veg[[12]]+ EC.Earth3.Veg.LR[[12]]+ FIO.ESM.2.0[[12]]+ GISS.E2.1.G[[12]]+ GISS.E2.1.H[[12]]+ INM.CM4.8[[12]]+ INM.CM5.0[[12]]+IPSL.CM6A.LR[[12]]+MIROC6[[12]]+ MIROC.ES2L[[12]]+ MIROC.ES2L[[12]]+ MPI.ESM1.2.HR[[12]]+MPI.ESM1.2.LR[[12]]+ MRI.ESM2.0[[12]]+UKESM1.0.LL[[12]]) #+ BCC.CSM2.MR[[12]]

ens_bio12_GCM<-ens_bio12_GCMs/22
x.stats.0 <- data.frame(x.mean=scale(cellStats(ens_bio12_GCM, "mean"))) %>% mutate("GCM" = "Ensemble")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.ACCESS.CM2<-ACCESS.CM2[[12]]-ens_bio12_GCM
x.stats.1 <- data.frame(x.mean=scale(cellStats(d.ACCESS.CM2, "mean"))) %>% mutate("GCM" = "ACCESS.CM2")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.ACCESS.ESM1<-ACCESS.ESM1.5[[12]]-ens_bio12_GCM
x.stats.2 <- data.frame(x.mean=scale(cellStats(d.ACCESS.ESM1, "mean"))) %>% mutate("GCM" = "ACCESS.ESM1.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.BCC.CSM2.MR<-BCC.CSM2.MR[[12]]-ens_bio12_GCM
x.stats.3 <- data.frame(x.mean=scale(cellStats(d.BCC.CSM2.MR, "mean"))) %>% mutate("GCM" = "BCC.CSM2.MR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CanESM5<-CanESM5[[12]]-ens_bio12_GCM
x.stats.4 <- data.frame(x.mean=scale(cellStats(d.CanESM5,"mean"))) %>% mutate("GCM" = "CanESM5.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CanESM5.CanOE<-CanESM5.CanOE[[12]]-ens_bio12_GCM
x.stats.5 <- data.frame(x.mean=scale(cellStats(d.CanESM5.CanOE, "mean"))) %>% mutate("GCM" = "CanESM5.CanOE.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CMCC.ESM2<-CMCC.ESM2[[12]]-ens_bio12_GCM
x.stats.6 <- data.frame(x.mean=scale(cellStats(d.CMCC.ESM2, "mean"))) %>% mutate("GCM" = "CMCC.ESM2.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CNRM.CM6.1<- CNRM.CM6.1[[12]]-ens_bio12_GCM
x.stats.7 <- data.frame(x.mean=scale(cellStats(d.CNRM.CM6.1, "mean"))) %>% mutate("GCM" = "CNRM.CM6.1")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CNRM.CM6.1.HR<-CNRM.CM6.1.HR[[12]]-ens_bio12_GCM
x.stats.8 <- data.frame(x.mean=scale(cellStats(d.CNRM.CM6.1.HR, "mean"))) %>% mutate("GCM" = "CNRM.CM6.1.HR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CNRM.ESM2.1<-CNRM.ESM2.1[[12]]-ens_bio12_GCM
x.stats.9 <- data.frame(x.mean=scale(cellStats(d.CNRM.ESM2.1, "mean"))) %>% mutate("GCM" = "CNRM.ESM2.1")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.EC.Earth3.Veg<-EC.Earth3.Veg[[12]]-ens_bio12_GCM
x.stats.10 <- data.frame(x.mean=scale(cellStats(d.EC.Earth3.Veg, "mean"))) %>% mutate("GCM" = "EC.Earth3.Veg")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.EC.Earth3.Veg.LR<-EC.Earth3.Veg.LR[[12]]-ens_bio12_GCM
x.stats.11 <- data.frame(x.mean=scale(cellStats(d.EC.Earth3.Veg.LR, "mean"))) %>% mutate("GCM" = "EC.Earth3.Veg.LR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.FIO.ESM.2.0<-FIO.ESM.2.0[[12]]-ens_bio12_GCM
x.stats.12 <- data.frame(x.mean=scale(cellStats(d.FIO.ESM.2.0, "mean"))) %>% mutate("GCM" = "FIO.ESM.2.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.GISS.E2.1.G<-GISS.E2.1.G[[12]]-ens_bio12_GCM
x.stats.13 <- data.frame(x.mean=scale(cellStats(d.GISS.E2.1.G, "mean"))) %>% mutate("GCM" = "GISS.E2.1.G")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.GISS.E2.1.H<-GISS.E2.1.H[[12]]-ens_bio12_GCM
x.stats.14 <- data.frame(x.mean=scale(cellStats(d.GISS.E2.1.H, "mean"))) %>% mutate("GCM" = "GISS.E2.1.H")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.INM.CM4.8<-INM.CM4.8[[12]]-ens_bio12_GCM
x.stats.15 <- data.frame(x.mean=scale(cellStats(d.INM.CM4.8, "mean"))) %>% mutate("GCM" = "INM.CM4.8")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.INM.CM5.0<-INM.CM5.0[[12]]-ens_bio12_GCM
x.stats.16 <- data.frame(x.mean=scale(cellStats(d.INM.CM5.0, "mean"))) %>% mutate("GCM" = "INM.CM5.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.IPSL.CM6A.LR<-IPSL.CM6A.LR[[12]]-ens_bio12_GCM
x.stats.17 <- data.frame(x.mean=scale(cellStats(d.IPSL.CM6A.LR, "mean"))) %>% mutate("GCM" = "IPSL.CM6A.LR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MIROC6<-MIROC6[[12]]-ens_bio12_GCM
x.stats.18 <- data.frame(x.mean=scale(cellStats(d.MIROC6, "mean"))) %>% mutate("GCM" = "MIROC6")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MIROC.ES2L<-MIROC.ES2L[[12]]-ens_bio12_GCM
x.stats.19 <- data.frame(x.mean=scale(cellStats(d.MIROC.ES2L, "mean"))) %>% mutate("GCM" = "MIROC.ES2L")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MPI.ESM1.2.HR<-MPI.ESM1.2.HR[[12]]-ens_bio12_GCM
x.stats.20 <- data.frame(x.mean=scale(cellStats(d.MPI.ESM1.2.HR, "mean"))) %>% mutate("GCM" = "MPI.ESM1.2.HR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MPI.ESM1.2.LR<-MPI.ESM1.2.LR[[12]]-ens_bio12_GCM
x.stats.21 <- data.frame(x.mean=scale(cellStats(d.MPI.ESM1.2.LR, "mean"))) %>% mutate("GCM" = "MPI.ESM1.2")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MRI.ESM2.0<-MRI.ESM2.0[[12]]-ens_bio12_GCM
x.stats.22 <- data.frame(x.mean=scale(cellStats(d.MRI.ESM2.0, "mean"))) %>% mutate("GCM" = "MRI.ESM2.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.UKESM1.0.LL<-UKESM1.0.LL[[12]]-ens_bio12_GCM
x.stats.23 <- data.frame(x.mean=scale(cellStats(d.UKESM1.0.LL, "mean"))) %>% mutate("GCM" = "UKESM1.0.LL")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

Bio12_between_GCM<-rbind(x.stats.0,x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23)#x.stats.3,

write.csv(Bio12_between_GCM, "C:/COBERTURAS/Bio12_between_GCM.csv")

rm(x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23)

rm(d.ACCESS.CM2,d.ACCESS.ESM1,d.BCC.CSM2.MR,d.CanESM5,d.CanESM5.CanOE,d.CMCC.ESM2,d.CNRM.CM6.1,d.CNRM.CM6.1.HR,d.CNRM.ESM2.1,d.EC.Earth3.Veg,d.EC.Earth3.Veg.LR,d.FIO.ESM.2.0,d.GISS.E2.1.G,d.GISS.E2.1.H,d.INM.CM4.8,d.INM.CM5.0,d.IPSL.CM6A.LR,d.MIROC6,d.MIROC.ES2L,d.MPI.ESM1.2.HR,d.MPI.ESM1.2.LR,d.MRI.ESM2.0,d.UKESM1.0.LL)

#####
Compare<-rbind(Bio12_between_GCM,Bio01_between_GCM)
View(Compare)
rm(Compare,Bio12_between_GCM,Bio01_between_GCM, tabla_p,x.stats.0,ens_bio01_GCMs,ens_bio12_GCMs, ens_bio01_GCM, ens_bio12_GCM)
