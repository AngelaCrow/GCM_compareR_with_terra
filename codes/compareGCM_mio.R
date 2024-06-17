library(tidyverse)
library(terra)

maskara<-terra::rast("malla_1kmPR_sI_g.tif")

#Variabes Presente####
presente<-terra::crop(terra:::rast(list.files("wc2.1_30s_bio/",full.names = T, pattern=".tif$")),maskara);presente 
medias_presente <- global(presente, fun = mean, na.rm = TRUE)
x.stats.0 <- data.frame(x.mean = medias_presente, GCM = "Baseline", Delta = "meanBaseline")
write.csv(x.stats.0, "MeanBio_Presente.csv", row.names = F)

#Variables Futuro#####
#ACCESS.CM2<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_ACCESS-CM2_ssp126_2021-2040.tif"),maskara);ACCESS.CM2
CMCC.ESM2<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_CMCC-ESM2_ssp126_2021-2040.tif"),maskara);CMCC.ESM2
#EC.Earth3.Veg<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_EC-Earth3-Veg_ssp126_2021-2040.tif"),maskara);EC.Earth3.Veg
#FIO.ESM.2.0<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_FIO-ESM-2-0_ssp126_2021-2040.tif"),maskara);FIO.ESM.2.0
GISS.E2.1.G<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_GISS-E2-1-G_ssp126_2021-2040.tif"),maskara);GISS.E2.1.G
HadGEM3.GC31.LL<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_HadGEM3-GC31-LL_ssp126_2021-2040.tif"),maskara);HadGEM3.GC31.LL
INM.CM5.0<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_INM-CM5-0_ssp126_2021-2040.tif"),maskara);INM.CM5.0
IPSL.CM6A.LR<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_IPSL-CM6A-LR_ssp245_2021-2040.tif"),maskara);IPSL.CM6A.LR
MIROC6<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_MIROC6_ssp245_2021-2040.tif"),maskara);MIROC6
MPI.ESM1.2.HR<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_MPI-ESM1-2-HR_ssp245_2021-2040.tif"),maskara);MPI.ESM1.2.HR
MRI.ESM2.0<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_MRI-ESM2-0_ssp126_2021-2040.tif"),maskara);MRI.ESM2.0
UKESM1.0.LL<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_30s_bioc_UKESM1-0-LL_ssp126_2021-2040.tif"),maskara);UKESM1.0.LL

#Tabla
#medias_ACCESS_CM2####
medias_ACCESS_CM2 <- global(ACCESS.CM2, fun = mean, na.rm = TRUE)
x.stats.1 <- data.frame(x.mean = medias_ACCESS_CM2,GCM = "ACCESS.CM2",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_ACCESS_CM2)
#medias_CMCC.ESM2####
medias_CMCC.ESM2 <- global(CMCC.ESM2, fun = mean, na.rm = TRUE)
x.stats.2 <- data.frame(x.mean = medias_CMCC.ESM2,GCM = "CMCC.ESM2",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_CMCC.ESM2)
#medias_EC.Earth3.Veg####
medias_EC.Earth3.Veg <- global(EC.Earth3.Veg, fun = mean, na.rm = TRUE)
x.stats.3 <- data.frame(x.mean = medias_EC.Earth3.Veg,GCM = "EC.Earth3.Veg",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_EC.Earth3.Veg)
#medias_FIO.ESM.2.0####
medias_FIO.ESM.2.0 <- global(FIO.ESM.2.0, fun = mean, na.rm = TRUE)
x.stats.4 <- data.frame(x.mean = medias_FIO.ESM.2.0,GCM = "FIO.ESM.2.0",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_FIO.ESM.2.0)
#medias_GISS.E2.1.G####
medias_GISS.E2.1.G <- global(GISS.E2.1.G, fun = mean, na.rm = TRUE)
x.stats.5 <- data.frame(x.mean = medias_GISS.E2.1.G,GCM = "GISS.E2.1.G",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_GISS.E2.1.G)
#medias_HadGEM3.GC31.LL####
medias_HadGEM3.GC31.LL <- global(HadGEM3.GC31.LL, fun = mean, na.rm = TRUE)
x.stats.6 <- data.frame(x.mean = medias_HadGEM3.GC31.LL,GCM = "HadGEM3.GC31.LL",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_HadGEM3.GC31.LL)
#medias_INM.CM5.0####
medias_INM.CM5.0 <- global(INM.CM5.0, fun = mean, na.rm = TRUE)
x.stats.7 <- data.frame(x.mean = medias_INM.CM5.0,GCM = "INM.CM5.0",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_INM.CM5.0)
#medias_IPSL.CM6A.LR####
medias_IPSL.CM6A.LR <- global(IPSL.CM6A.LR, fun = mean, na.rm = TRUE)
x.stats.8 <- data.frame(x.mean = medias_IPSL.CM6A.LR,GCM = "IPSL.CM6A.LR",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_IPSL.CM6A.LR)
#medias_MIROC6####
medias_MIROC6 <- global(MIROC6, fun = mean, na.rm = TRUE)
x.stats.9 <- data.frame(x.mean = medias_MIROC6,GCM = "MIROC6",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_MIROC6)
#medias_MPI.ESM1.2.HR####
medias_MPI.ESM1.2.HR <- global(MPI.ESM1.2.HR, fun = mean, na.rm = TRUE)
x.stats.10 <- data.frame(x.mean = medias_MPI.ESM1.2.HR,GCM = "MPI.ESM1.2.HR",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_MPI.ESM1.2.HR)
#medias_MRI.ESM2.0####
medias_MRI.ESM2.0 <- global(MRI.ESM2.0, fun = mean, na.rm = TRUE)
x.stats.11 <- data.frame(x.mean = medias_MRI.ESM2.0,GCM = "MRI.ESM2.0",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_MRI.ESM2.0)
#medias_UKESM1.0.LL####
medias_UKESM1.0.LL <- global(UKESM1.0.LL, fun = mean, na.rm = TRUE)
x.stats.12 <- data.frame(x.mean = medias_UKESM1.0.LL,GCM = "UKESM1.0.LL",Delta = "meanFuture", Variable = paste("wc2_", 1:19, sep = ""))
rm(medias_UKESM1.0.LL)

tabla_p<-rbind(x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12)
View(tabla_p)

write.csv(tabla_p, "C:/COBERTURAS/MeanBio_GCMyPresente.csv")

rm(x.stats.0,x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)


#Diferencias del presente####
#bio####

d.ACCESS.CM2<-ACCESS.CM2-presente 
writeRaster(d.ACCESS.CM2, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.ACCESS.CM2.tif")
x.stats.1 <- data.frame(x.mean=cellStats(d.ACCESS.CM2, "mean")) %>% mutate("GCM" = "ACCESS.CM2")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CMCC.ESM2<-CMCC.ESM2-presente
writeRaster(d.CMCC.ESM2, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.CMCC.ESM2.tif")
x.stats.2 <- data.frame(x.mean=cellStats(d.CMCC.ESM2, "mean")) %>% mutate("GCM" = "CMCC.ESM2.5")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.EC.Earth3.Veg<-EC.Earth3.Veg-presente
writeRaster(d.EC.Earth3.Veg, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.EC.Earth3.Veg.tif")
x.stats.3 <- data.frame(x.mean=cellStats(d.EC.Earth3.Veg, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.FIO.ESM.2.0<-FIO.ESM.2.0-presente
writeRaster(d.FIO.ESM.2.0, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.FIO.ESM.2.0.tif")
x.stats.4 <- data.frame(x.mean=cellStats(d.FIO.ESM.2.0, "mean")) %>% mutate("GCM" = "FIO.ESM.2.0")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.GISS.E2.1.G<-GISS.E2.1.G-presente
writeRaster(d.GISS.E2.1.G, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.GISS.E2.1.G.tif")
x.stats.5 <- data.frame(x.mean=cellStats(d.GISS.E2.1.G, "mean")) %>% mutate("GCM" = "GISS.E2.1.G")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.HadGEM3.GC31.LL<-HadGEM3.GC31.LL-presente
writeRaster(d.HadGEM3.GC31.LL, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.HadGEM3.GC31.LL.tif")
x.stats.6 <- data.frame(x.mean=cellStats(HadGEM3.GC31.LL, "mean")) %>% mutate("GCM" = "HadGEM3.GC31.LL")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.INM.CM5.0<-INM.CM5.0-presente
writeRaster(d.INM.CM5.0, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.INM.CM5.0.tif")
x.stats.7 <- data.frame(x.mean=cellStats(d.INM.CM5.0, "mean")) %>% mutate("GCM" = "INM.CM5.0")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.IPSL.CM6A.LR<-IPSL.CM6A.LR-presente
writeRaster(d.IPSL.CM6A.LR, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.IPSL.CM6A.LR.tif")
x.stats.8 <- data.frame(x.mean=cellStats(d.IPSL.CM6A.LR, "mean")) %>% mutate("GCM" = "IPSL.CM6A.LR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MIROC6<-MIROC6-presente
writeRaster(d.MIROC6, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.MIROC6.tif")
x.stats.9 <- data.frame(x.mean=cellStats(d.MIROC6, "mean")) %>% mutate("GCM" = "MIROC6")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MPI.ESM1.2.HR<-MPI.ESM1.2.HR-presente
writeRaster(d.MPI.ESM1.2.HR, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.MPI.ESM1.2.HR.tif")
x.stats.10 <- data.frame(x.mean=cellStats(d.MPI.ESM1.2.HR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2.HR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MRI.ESM2.0<-MRI.ESM2.0-presente
writeRaster(d.MRI.ESM2.0, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.MRI.ESM2.0.tif")
x.stats.11 <- data.frame(x.mean=cellStats(d.MRI.ESM2.0, "mean")) %>% mutate("GCM" = "MRI.ESM2.0")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.UKESM1.0.LL<-UKESM1.0.LL-presente
writeRaster(d.UKESM1.0.LL, "/Volumes/TOSHIBA EXT/COBERTURAS/WC/ssp126_2021-2040/deltas/d.UKESM1.0.LL.tif")
x.stats.12 <- data.frame(x.mean=cellStats(d.UKESM1.0.LL, "mean")) %>% mutate("GCM" = "UKESM1.0.LL")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

Bio_from_p<-rbind(x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13)
View(Bio_from_p)

write.csv(Bio_from_p, "C:/COBERTURAS/dPresente.csv")

rm(x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)

rm(d.ACCESS.CM2,d.ACCESS.ESM1,d.BCC.CSM2.MR,d.CanESM5,d.CanESM5.CanOE,d.CMCC.ESM2,d.CNRM.CM6.1,d.CNRM.CM6.1.HR,d.CNRM.ESM2.1,d.EC.Earth3.Veg,d.EC.Earth3.Veg.LR,d.FIO.ESM.2.0,d.GISS.E2.1.G,d.GISS.E2.1.H,d.INM.CM4.8,d.INM.CM5.0,d.IPSL.CM6A.LR,d.MIROC6,d.MIROC.ES2L,d.MPI.ESM1.2.HR,d.MPI.ESM1.2.LR,d.MRI.ESM2.0,d.UKESM1.0.LL,d.HadGEM3.GC31.LL)


#Delta ensemble####
#bio1####
ens_bio01_GCMs<-(ACCESS.CM2[[1]]+ ACCESS.ESM1.5[[1]]+ CanESM5[[1]]+CanESM5.CanOE[[1]]+ CMCC.ESM2[[1]]+CNRM.CM6.1[[1]]+CNRM.CM6.1.HR[[1]]+ CNRM.ESM2.1[[1]]+ EC.Earth3.Veg[[1]]+ EC.Earth3.Veg.LR[[1]]+ FIO.ESM.2.0[[1]]+ GISS.E2.1.G[[1]]+ GISS.E2.1.H[[1]]+ INM.CM4.8[[1]]+ INM.CM5.0[[1]]+IPSL.CM6A.LR[[1]]+MIROC6[[1]]+ MIROC.ES2L[[1]]+ MIROC.ES2L[[1]]+ MPI.ESM1.2.HR[[1]]+MPI.ESM1.2.LR[[1]]+ MRI.ESM2.0[[1]]+UKESM1.0.LL[[1]]+HadGEM3.GC31.LL[[1]]) #borr? BCC.CSM2.MR[[1]]+

ens_bio01_GCM<-ens_bio01_GCMs/23 #Son 24 con el de BCC, pero entonces toca meterlo desde el inicio
x.stats.0 <- data.frame(x.mean=cellStats(ens_bio01_GCM, "mean")) %>% mutate("GCM" = "Ensemble")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.ACCESS.CM2<-ACCESS.CM2[[1]]-ens_bio01_GCM
x.stats.1 <- data.frame(x.mean=cellStats(d.ACCESS.CM2, "mean")) %>% mutate("GCM" = "ACCESS.CM2")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.ACCESS.ESM1<-ACCESS.ESM1.5[[1]]-ens_bio01_GCM
x.stats.2 <- data.frame(x.mean=cellStats(d.ACCESS.ESM1, "mean")) %>% mutate("GCM" = "ACCESS.ESM1.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.BCC.CSM2.MR<-BCC.CSM2.MR[[1]]-ens_bio01_GCM
x.stats.3 <- data.frame(x.mean=cellStats(d.BCC.CSM2.MR, "mean")) %>% mutate("GCM" = "BCC.CSM2.MR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

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

d.HadGEM3.GC31.LL<-HadGEM3.GC31.LL[[1]]-ens_bio01_GCM
x.stats.24 <- data.frame(x.mean=cellStats(d.HadGEM3.GC31.LL, "mean")) %>% mutate("GCM" = "HadGEM3.GC31.LL")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")


Bio01_between_GCM<-rbind(x.stats.0,x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)#x.stats.3, sin

write.csv(Bio01_between_GCM, "C:/COBERTURAS/Bio01_between_GCM.csv")

rm(x.stats.0,x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)

rm(d.ACCESS.CM2,d.ACCESS.ESM1,d.BCC.CSM2.MR,d.CanESM5,d.CanESM5.CanOE,d.CMCC.ESM2,d.CNRM.CM6.1,d.CNRM.CM6.1.HR,d.CNRM.ESM2.1,d.EC.Earth3.Veg,d.EC.Earth3.Veg.LR,d.FIO.ESM.2.0,d.GISS.E2.1.G,d.GISS.E2.1.H,d.INM.CM4.8,d.INM.CM5.0,d.IPSL.CM6A.LR,d.MIROC6,d.MIROC.ES2L,d.MPI.ESM1.2.HR,d.MPI.ESM1.2.LR,d.MRI.ESM2.0,d.UKESM1.0.LL,d.HadGEM3.GC31.LL)

#bio12####
ens_bio12_GCMs<-(ACCESS.CM2[[12]]+ ACCESS.ESM1.5[[12]]+ CanESM5[[12]]+CanESM5.CanOE[[12]]+ CMCC.ESM2[[12]]+CNRM.CM6.1[[12]]+CNRM.CM6.1.HR[[12]]+ CNRM.ESM2.1[[12]]+ EC.Earth3.Veg[[12]]+ EC.Earth3.Veg.LR[[12]]+ FIO.ESM.2.0[[12]]+ GISS.E2.1.G[[12]]+ GISS.E2.1.H[[12]]+ INM.CM4.8[[12]]+ INM.CM5.0[[12]]+IPSL.CM6A.LR[[12]]+MIROC6[[12]]+ MIROC.ES2L[[12]]+ MIROC.ES2L[[12]]+ MPI.ESM1.2.HR[[12]]+MPI.ESM1.2.LR[[12]]+ MRI.ESM2.0[[12]]+UKESM1.0.LL[[12]]+HadGEM3.GC31.LL[[12]])

ens_bio12_GCM<-ens_bio12_GCMs/23
x.stats.0 <- data.frame(x.mean=cellStats(ens_bio12_GCM, "mean")) %>% mutate("GCM" = "Ensemble")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.ACCESS.CM2<-ACCESS.CM2[[12]]-ens_bio12_GCM
x.stats.1 <- data.frame(x.mean=cellStats(d.ACCESS.CM2, "mean")) %>% mutate("GCM" = "ACCESS.CM2")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.ACCESS.ESM1<-ACCESS.ESM1.5[[12]]-ens_bio12_GCM
x.stats.2 <- data.frame(x.mean=cellStats(d.ACCESS.ESM1, "mean")) %>% mutate("GCM" = "ACCESS.ESM1.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.BCC.CSM2.MR<-BCC.CSM2.MR[[12]]-ens_bio12_GCM
x.stats.3 <- data.frame(x.mean=cellStats(d.BCC.CSM2.MR, "mean")) %>% mutate("GCM" = "BCC.CSM2.MR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CanESM5<-CanESM5[[12]]-ens_bio12_GCM
x.stats.4 <- data.frame(x.mean=cellStats(d.CanESM5,"mean")) %>% mutate("GCM" = "CanESM5.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CanESM5.CanOE<-CanESM5.CanOE[[12]]-ens_bio12_GCM
x.stats.5 <- data.frame(x.mean=cellStats(d.CanESM5.CanOE, "mean")) %>% mutate("GCM" = "CanESM5.CanOE.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CMCC.ESM2<-CMCC.ESM2[[12]]-ens_bio12_GCM
x.stats.6 <- data.frame(x.mean=cellStats(d.CMCC.ESM2, "mean")) %>% mutate("GCM" = "CMCC.ESM2.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CNRM.CM6.1<- CNRM.CM6.1[[12]]-ens_bio12_GCM
x.stats.7 <- data.frame(x.mean=cellStats(d.CNRM.CM6.1, "mean")) %>% mutate("GCM" = "CNRM.CM6.1")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CNRM.CM6.1.HR<-CNRM.CM6.1.HR[[12]]-ens_bio12_GCM
x.stats.8 <- data.frame(x.mean=cellStats(d.CNRM.CM6.1.HR, "mean")) %>% mutate("GCM" = "CNRM.CM6.1.HR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CNRM.ESM2.1<-CNRM.ESM2.1[[12]]-ens_bio12_GCM
x.stats.9 <- data.frame(x.mean=cellStats(d.CNRM.ESM2.1, "mean")) %>% mutate("GCM" = "CNRM.ESM2.1")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.EC.Earth3.Veg<-EC.Earth3.Veg[[12]]-ens_bio12_GCM
x.stats.10 <- data.frame(x.mean=cellStats(d.EC.Earth3.Veg, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.EC.Earth3.Veg.LR<-EC.Earth3.Veg.LR[[12]]-ens_bio12_GCM
x.stats.11 <- data.frame(x.mean=cellStats(d.EC.Earth3.Veg.LR, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg.LR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.FIO.ESM.2.0<-FIO.ESM.2.0[[12]]-ens_bio12_GCM
x.stats.12 <- data.frame(x.mean=cellStats(d.FIO.ESM.2.0, "mean")) %>% mutate("GCM" = "FIO.ESM.2.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.GISS.E2.1.G<-GISS.E2.1.G[[12]]-ens_bio12_GCM
x.stats.13 <- data.frame(x.mean=cellStats(d.GISS.E2.1.G, "mean")) %>% mutate("GCM" = "GISS.E2.1.G")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.GISS.E2.1.H<-GISS.E2.1.H[[12]]-ens_bio12_GCM
x.stats.14 <- data.frame(x.mean=cellStats(d.GISS.E2.1.H, "mean")) %>% mutate("GCM" = "GISS.E2.1.H")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.INM.CM4.8<-INM.CM4.8[[12]]-ens_bio12_GCM
x.stats.15 <- data.frame(x.mean=cellStats(d.INM.CM4.8, "mean")) %>% mutate("GCM" = "INM.CM4.8")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.INM.CM5.0<-INM.CM5.0[[12]]-ens_bio12_GCM
x.stats.16 <- data.frame(x.mean=cellStats(d.INM.CM5.0, "mean")) %>% mutate("GCM" = "INM.CM5.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.IPSL.CM6A.LR<-IPSL.CM6A.LR[[12]]-ens_bio12_GCM
x.stats.17 <- data.frame(x.mean=cellStats(d.IPSL.CM6A.LR, "mean")) %>% mutate("GCM" = "IPSL.CM6A.LR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MIROC6<-MIROC6[[12]]-ens_bio12_GCM
x.stats.18 <- data.frame(x.mean=cellStats(d.MIROC6, "mean")) %>% mutate("GCM" = "MIROC6")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MIROC.ES2L<-MIROC.ES2L[[12]]-ens_bio12_GCM
x.stats.19 <- data.frame(x.mean=cellStats(d.MIROC.ES2L, "mean")) %>% mutate("GCM" = "MIROC.ES2L")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MPI.ESM1.2.HR<-MPI.ESM1.2.HR[[12]]-ens_bio12_GCM
x.stats.20 <- data.frame(x.mean=cellStats(d.MPI.ESM1.2.HR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2.HR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MPI.ESM1.2.LR<-MPI.ESM1.2.LR[[12]]-ens_bio12_GCM
x.stats.21 <- data.frame(x.mean=cellStats(d.MPI.ESM1.2.LR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MRI.ESM2.0<-MRI.ESM2.0[[12]]-ens_bio12_GCM
x.stats.22 <- data.frame(x.mean=cellStats(d.MRI.ESM2.0, "mean")) %>% mutate("GCM" = "MRI.ESM2.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.UKESM1.0.LL<-UKESM1.0.LL[[12]]-ens_bio12_GCM
x.stats.23 <- data.frame(x.mean=cellStats(d.UKESM1.0.LL, "mean")) %>% mutate("GCM" = "UKESM1.0.LL")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.HadGEM3.GC31.LL<-HadGEM3.GC31.LL[[12]]-ens_bio12_GCM
x.stats.24 <- data.frame(x.mean=cellStats(d.HadGEM3.GC31.LL, "mean")) %>% mutate("GCM" = "HadGEM3.GC31.LL")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

Bio12_between_GCM<-rbind(x.stats.0,x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)#x.stats.3,

write.csv(Bio12_between_GCM, "C:/COBERTURAS/Bio12_between_GCM.csv")

rm(x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)

rm(d.ACCESS.CM2,d.ACCESS.ESM1,d.BCC.CSM2.MR,d.CanESM5,d.CanESM5.CanOE,d.CMCC.ESM2,d.CNRM.CM6.1,d.CNRM.CM6.1.HR,d.CNRM.ESM2.1,d.EC.Earth3.Veg,d.EC.Earth3.Veg.LR,d.FIO.ESM.2.0,d.GISS.E2.1.G,d.GISS.E2.1.H,d.INM.CM4.8,d.INM.CM5.0,d.IPSL.CM6A.LR,d.MIROC6,d.MIROC.ES2L,d.MPI.ESM1.2.HR,d.MPI.ESM1.2.LR,d.MRI.ESM2.0,d.UKESM1.0.LL,d.HadGEM3.GC31.LL)

#####
Compare<-rbind(Bio12_between_GCM,Bio01_between_GCM)
View(Compare)

#SSP585#####
#Variabes Presente####
presente<-raster:::stack(list.files("C:/COBERTURAS/wc2.1_2.5m_bio",full.names = T, pattern=".tif$")) 
presente<-terra::crop(presente, maskara)
x.stats.0 <- data.frame(x.mean=cellStats(presente, "mean")) %>% mutate("GCM" = "Baseline")%>% mutate("Delta" = "meanBaseline") 
#write.csv(x.stats.0, "C:/COBERTURAS/MeanBio_Presente.csv")

#Variables Futuro#####
ACCESS.CM2<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_ACCESS-CM2_ssp585_2041_2060.tif"),maskara) #1
ACCESS.ESM1.5<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_ACCESS-ESM1-5_ssp585_2041_2060.tif"),maskara) #2
#BCC.CSM2.MR<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_BCC-CSM2-MR_ssp585_2041_2060.tif"),maskara)#3
CanESM5<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_CanESM5_ssp585_2041-2060.tif"),maskara)#4
CanESM5.CanOE<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_CanESM5-CanOE_ssp585_2041_2060.tif"),maskara)#5
CMCC.ESM2<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_CMCC-ESM2_ssp585_2041_2060.tif"),maskara)#6
CNRM.CM6.1<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_CNRM-CM6-1_ssp585_2041_2060.tif"),maskara)#7
CNRM.CM6.1.HR<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_CNRM-CM6-1-HR_ssp585_2041_2060.tif"),maskara)#8
CNRM.ESM2.1<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_CNRM-ESM2-1_ssp585_2041_2060.tif"),maskara)#9
EC.Earth3.Veg<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_EC-Earth3-Veg_ssp585_2041_2060.tif"),maskara)#10
EC.Earth3.Veg.LR<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_EC-Earth3-Veg-LR_ssp585_2041_2060.tif"),maskara)#11
FIO.ESM.2.0<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_FIO-ESM-2-0_ssp585_2041_2060.tif"),maskara)#12
GISS.E2.1.G<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_GISS-E2-1-G_ssp585_2041_2060.tif"),maskara)#13
GISS.E2.1.H<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_GISS-E2-1-H_ssp585_2041_2060.tif"),maskara)#14
INM.CM4.8<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_INM-CM4-8_ssp585_2041_2060.tif"),maskara)#15
INM.CM5.0<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_INM-CM5-0_ssp585_2041_2060.tif"),maskara)#16
IPSL.CM6A.LR<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_IPSL-CM6A-LR_ssp585_2041_2060.tif"),maskara)#17
MIROC6<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_MIROC6_ssp585_2041_2060.tif"),maskara)#18
MIROC.ES2L<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_MIROC-ES2L_ssp585_2041_2060.tif"),maskara)#19
MPI.ESM1.2.HR<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_MPI-ESM1-2-HR_ssp585_2041_2060.tif"),maskara)#20
MPI.ESM1.2.LR<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_MPI-ESM1-2-LR_ssp585_2041_2060.tif"),maskara)#21
MRI.ESM2.0<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_MRI-ESM2-0_ssp585_2041_2060.tif"),maskara)#22
UKESM1.0.LL<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_UKESM1-0-LL_ssp585_2041_2060.tif"),maskara)#23
HadGEM3.GC31.LL<-terra::crop(terra::rast("ssp126_2021-2040/wc2.1_2.5m_bioc_HadGEM3-GC31-LL_ssp585_2041_2060.tif"),maskara)#24


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
x.stats.24 <- data.frame(x.mean=cellStats(HadGEM3.GC31.LL, "mean")) %>% mutate("GCM" = "HadGEM3.GC31.LL")%>% mutate("Delta" = "meanFuture")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

tabla_p<-rbind(x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.23,x.stats.24)
View(tabla_p)

write.csv(tabla_p, "C:/COBERTURAS/MeanBio_GCMyPresente.csv")

rm(x.stats.0,x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)


#Diferencias del presente####
#bio####

d.ACCESS.CM2<-ACCESS.CM2-presente 
x.stats.1 <- data.frame(x.mean=cellStats(d.ACCESS.CM2, "mean")) %>% mutate("GCM" = "ACCESS.CM2")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.ACCESS.ESM1<-ACCESS.ESM1.5-presente
x.stats.2 <- data.frame(x.mean=cellStats(d.ACCESS.ESM1, "mean")) %>% mutate("GCM" = "ACCESS.ESM1.5")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

#d.BCC.CSM2.MR<-BCC.CSM2.MR-presente
#x.stats.3 <- data.frame(x.mean=cellStats(d.BCC.CSM2.MR, "mean")) %>% mutate("GCM" = "BCC.CSM2.MR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CanESM5<-CanESM5-presente
x.stats.4 <- data.frame(x.mean=cellStats(d.CanESM5,"mean")) %>% mutate("GCM" = "CanESM5.5")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CanESM5.CanOE<-CanESM5.CanOE-presente
x.stats.5 <- data.frame(x.mean=cellStats(d.CanESM5.CanOE, "mean")) %>% mutate("GCM" = "CanESM5.CanOE.5")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CMCC.ESM2<-CMCC.ESM2-presente
x.stats.6 <- data.frame(x.mean=cellStats(d.CMCC.ESM2, "mean")) %>% mutate("GCM" = "CMCC.ESM2.5")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CNRM.CM6.1<- CNRM.CM6.1-presente
x.stats.7 <- data.frame(x.mean=cellStats(d.CNRM.CM6.1, "mean")) %>% mutate("GCM" = "CNRM.CM6.1")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CNRM.CM6.1.HR<-CNRM.CM6.1.HR-presente
x.stats.8 <- data.frame(x.mean=cellStats(d.CNRM.CM6.1.HR, "mean")) %>% mutate("GCM" = "CNRM.CM6.1.HR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.CNRM.ESM2.1<-CNRM.ESM2.1-presente
x.stats.9 <- data.frame(x.mean=cellStats(d.CNRM.ESM2.1, "mean")) %>% mutate("GCM" = "CNRM.ESM2.1")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.EC.Earth3.Veg<-EC.Earth3.Veg-presente
x.stats.10 <- data.frame(x.mean=cellStats(d.EC.Earth3.Veg, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.EC.Earth3.Veg.LR<-EC.Earth3.Veg.LR-presente
x.stats.11 <- data.frame(x.mean=cellStats(d.EC.Earth3.Veg.LR, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg.LR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.FIO.ESM.2.0<-FIO.ESM.2.0-presente
x.stats.12 <- data.frame(x.mean=cellStats(d.FIO.ESM.2.0, "mean")) %>% mutate("GCM" = "FIO.ESM.2.0")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.GISS.E2.1.G<-GISS.E2.1.G-presente
x.stats.13 <- data.frame(x.mean=cellStats(d.GISS.E2.1.G, "mean")) %>% mutate("GCM" = "GISS.E2.1.G")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.GISS.E2.1.H<-GISS.E2.1.H-presente
x.stats.14 <- data.frame(x.mean=cellStats(d.GISS.E2.1.H, "mean")) %>% mutate("GCM" = "GISS.E2.1.H")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.INM.CM4.8<-INM.CM4.8-presente
x.stats.15 <- data.frame(x.mean=cellStats(d.INM.CM4.8, "mean")) %>% mutate("GCM" = "INM.CM4.8")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.INM.CM5.0<-INM.CM5.0-presente
x.stats.16 <- data.frame(x.mean=cellStats(d.INM.CM5.0, "mean")) %>% mutate("GCM" = "INM.CM5.0")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.IPSL.CM6A.LR<-IPSL.CM6A.LR-presente
x.stats.17 <- data.frame(x.mean=cellStats(d.IPSL.CM6A.LR, "mean")) %>% mutate("GCM" = "IPSL.CM6A.LR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MIROC6<-MIROC6-presente
x.stats.18 <- data.frame(x.mean=cellStats(d.MIROC6, "mean")) %>% mutate("GCM" = "MIROC6")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MIROC.ES2L<-MIROC.ES2L-presente
x.stats.19 <- data.frame(x.mean=cellStats(d.MIROC.ES2L, "mean")) %>% mutate("GCM" = "MIROC.ES2L")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MPI.ESM1.2.HR<-MPI.ESM1.2.HR-presente
x.stats.20 <- data.frame(x.mean=cellStats(d.MPI.ESM1.2.HR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2.HR")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MPI.ESM1.2.LR<-MPI.ESM1.2.LR-presente
x.stats.21 <- data.frame(x.mean=cellStats(d.MPI.ESM1.2.LR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.MRI.ESM2.0<-MRI.ESM2.0-presente
x.stats.22 <- data.frame(x.mean=cellStats(d.MRI.ESM2.0, "mean")) %>% mutate("GCM" = "MRI.ESM2.0")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.UKESM1.0.LL<-UKESM1.0.LL-presente
x.stats.23 <- data.frame(x.mean=cellStats(d.UKESM1.0.LL, "mean")) %>% mutate("GCM" = "UKESM1.0.LL")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

d.HadGEM3.GC31.LL<-HadGEM3.GC31.LL-presente
x.stats.24 <- data.frame(x.mean=cellStats(HadGEM3.GC31.LL, "mean")) %>% mutate("GCM" = "HadGEM3.GC31.LL")%>% mutate("Delta" = "From Presente")%>% mutate("Variable"=paste("wc2_",seq(1:19)))

#Hay que incluir x.stats.3,

Bio_from_p<-rbind(x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)
View(Bio_from_p)

write.csv(Bio_from_p, "C:/COBERTURAS/dPresente.csv")

rm(x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)

rm(d.ACCESS.CM2,d.ACCESS.ESM1,d.BCC.CSM2.MR,d.CanESM5,d.CanESM5.CanOE,d.CMCC.ESM2,d.CNRM.CM6.1,d.CNRM.CM6.1.HR,d.CNRM.ESM2.1,d.EC.Earth3.Veg,d.EC.Earth3.Veg.LR,d.FIO.ESM.2.0,d.GISS.E2.1.G,d.GISS.E2.1.H,d.INM.CM4.8,d.INM.CM5.0,d.IPSL.CM6A.LR,d.MIROC6,d.MIROC.ES2L,d.MPI.ESM1.2.HR,d.MPI.ESM1.2.LR,d.MRI.ESM2.0,d.UKESM1.0.LL,d.HadGEM3.GC31.LL)


#Delta ensemble####
#bio1####
ens_bio01_GCMs<-(ACCESS.CM2[[1]]+ ACCESS.ESM1.5[[1]]+ CanESM5[[1]]+CanESM5.CanOE[[1]]+ CMCC.ESM2[[1]]+CNRM.CM6.1[[1]]+CNRM.CM6.1.HR[[1]]+ CNRM.ESM2.1[[1]]+ EC.Earth3.Veg[[1]]+ EC.Earth3.Veg.LR[[1]]+ FIO.ESM.2.0[[1]]+ GISS.E2.1.G[[1]]+ GISS.E2.1.H[[1]]+ INM.CM4.8[[1]]+ INM.CM5.0[[1]]+IPSL.CM6A.LR[[1]]+MIROC6[[1]]+ MIROC.ES2L[[1]]+ MIROC.ES2L[[1]]+ MPI.ESM1.2.HR[[1]]+MPI.ESM1.2.LR[[1]]+ MRI.ESM2.0[[1]]+UKESM1.0.LL[[1]]+HadGEM3.GC31.LL[[1]]) #borr? BCC.CSM2.MR[[1]]+

ens_bio01_GCM<-ens_bio01_GCMs/23 #Son 24 con el de BCC, pero entonces toca meterlo desde el inicio
x.stats.0 <- data.frame(x.mean=cellStats(ens_bio01_GCM, "mean")) %>% mutate("GCM" = "Ensemble")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.ACCESS.CM2<-ACCESS.CM2[[1]]-ens_bio01_GCM
x.stats.1 <- data.frame(x.mean=cellStats(d.ACCESS.CM2, "mean")) %>% mutate("GCM" = "ACCESS.CM2")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

d.ACCESS.ESM1<-ACCESS.ESM1.5[[1]]-ens_bio01_GCM
x.stats.2 <- data.frame(x.mean=cellStats(d.ACCESS.ESM1, "mean")) %>% mutate("GCM" = "ACCESS.ESM1.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

#d.BCC.CSM2.MR<-BCC.CSM2.MR[[1]]-ens_bio01_GCM
#x.stats.3 <- data.frame(x.mean=cellStats(d.BCC.CSM2.MR, "mean")) %>% mutate("GCM" = "BCC.CSM2.MR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")

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

d.HadGEM3.GC31.LL<-HadGEM3.GC31.LL[[1]]-ens_bio01_GCM
x.stats.24 <- data.frame(x.mean=cellStats(d.HadGEM3.GC31.LL, "mean")) %>% mutate("GCM" = "HadGEM3.GC31.LL")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio1")


Bio01_between_GCM<-rbind(x.stats.0,x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)#x.stats.3, sin

write.csv(Bio01_between_GCM, "C:/COBERTURAS/Bio01_between_GCM.csv")

rm(x.stats.0,x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)

rm(d.ACCESS.CM2,d.ACCESS.ESM1,d.BCC.CSM2.MR,d.CanESM5,d.CanESM5.CanOE,d.CMCC.ESM2,d.CNRM.CM6.1,d.CNRM.CM6.1.HR,d.CNRM.ESM2.1,d.EC.Earth3.Veg,d.EC.Earth3.Veg.LR,d.FIO.ESM.2.0,d.GISS.E2.1.G,d.GISS.E2.1.H,d.INM.CM4.8,d.INM.CM5.0,d.IPSL.CM6A.LR,d.MIROC6,d.MIROC.ES2L,d.MPI.ESM1.2.HR,d.MPI.ESM1.2.LR,d.MRI.ESM2.0,d.UKESM1.0.LL,d.HadGEM3.GC31.LL)

#bio12####
ens_bio12_GCMs<-(ACCESS.CM2[[12]]+ ACCESS.ESM1.5[[12]]+ CanESM5[[12]]+CanESM5.CanOE[[12]]+ CMCC.ESM2[[12]]+CNRM.CM6.1[[12]]+CNRM.CM6.1.HR[[12]]+ CNRM.ESM2.1[[12]]+ EC.Earth3.Veg[[12]]+ EC.Earth3.Veg.LR[[12]]+ FIO.ESM.2.0[[12]]+ GISS.E2.1.G[[12]]+ GISS.E2.1.H[[12]]+ INM.CM4.8[[12]]+ INM.CM5.0[[12]]+IPSL.CM6A.LR[[12]]+MIROC6[[12]]+ MIROC.ES2L[[12]]+ MIROC.ES2L[[12]]+ MPI.ESM1.2.HR[[12]]+MPI.ESM1.2.LR[[12]]+ MRI.ESM2.0[[12]]+UKESM1.0.LL[[12]]+HadGEM3.GC31.LL[[12]])

ens_bio12_GCM<-ens_bio12_GCMs/23
x.stats.0 <- data.frame(x.mean=cellStats(ens_bio12_GCM, "mean")) %>% mutate("GCM" = "Ensemble")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.ACCESS.CM2<-ACCESS.CM2[[12]]-ens_bio12_GCM
x.stats.1 <- data.frame(x.mean=cellStats(d.ACCESS.CM2, "mean")) %>% mutate("GCM" = "ACCESS.CM2")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.ACCESS.ESM1<-ACCESS.ESM1.5[[12]]-ens_bio12_GCM
x.stats.2 <- data.frame(x.mean=cellStats(d.ACCESS.ESM1, "mean")) %>% mutate("GCM" = "ACCESS.ESM1.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.BCC.CSM2.MR<-BCC.CSM2.MR[[12]]-ens_bio12_GCM
x.stats.3 <- data.frame(x.mean=cellStats(d.BCC.CSM2.MR, "mean")) %>% mutate("GCM" = "BCC.CSM2.MR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CanESM5<-CanESM5[[12]]-ens_bio12_GCM
x.stats.4 <- data.frame(x.mean=cellStats(d.CanESM5,"mean")) %>% mutate("GCM" = "CanESM5.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CanESM5.CanOE<-CanESM5.CanOE[[12]]-ens_bio12_GCM
x.stats.5 <- data.frame(x.mean=cellStats(d.CanESM5.CanOE, "mean")) %>% mutate("GCM" = "CanESM5.CanOE.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CMCC.ESM2<-CMCC.ESM2[[12]]-ens_bio12_GCM
x.stats.6 <- data.frame(x.mean=cellStats(d.CMCC.ESM2, "mean")) %>% mutate("GCM" = "CMCC.ESM2.5")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CNRM.CM6.1<- CNRM.CM6.1[[12]]-ens_bio12_GCM
x.stats.7 <- data.frame(x.mean=cellStats(d.CNRM.CM6.1, "mean")) %>% mutate("GCM" = "CNRM.CM6.1")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CNRM.CM6.1.HR<-CNRM.CM6.1.HR[[12]]-ens_bio12_GCM
x.stats.8 <- data.frame(x.mean=cellStats(d.CNRM.CM6.1.HR, "mean")) %>% mutate("GCM" = "CNRM.CM6.1.HR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.CNRM.ESM2.1<-CNRM.ESM2.1[[12]]-ens_bio12_GCM
x.stats.9 <- data.frame(x.mean=cellStats(d.CNRM.ESM2.1, "mean")) %>% mutate("GCM" = "CNRM.ESM2.1")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.EC.Earth3.Veg<-EC.Earth3.Veg[[12]]-ens_bio12_GCM
x.stats.10 <- data.frame(x.mean=cellStats(d.EC.Earth3.Veg, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.EC.Earth3.Veg.LR<-EC.Earth3.Veg.LR[[12]]-ens_bio12_GCM
x.stats.11 <- data.frame(x.mean=cellStats(d.EC.Earth3.Veg.LR, "mean")) %>% mutate("GCM" = "EC.Earth3.Veg.LR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.FIO.ESM.2.0<-FIO.ESM.2.0[[12]]-ens_bio12_GCM
x.stats.12 <- data.frame(x.mean=cellStats(d.FIO.ESM.2.0, "mean")) %>% mutate("GCM" = "FIO.ESM.2.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.GISS.E2.1.G<-GISS.E2.1.G[[12]]-ens_bio12_GCM
x.stats.13 <- data.frame(x.mean=cellStats(d.GISS.E2.1.G, "mean")) %>% mutate("GCM" = "GISS.E2.1.G")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.GISS.E2.1.H<-GISS.E2.1.H[[12]]-ens_bio12_GCM
x.stats.14 <- data.frame(x.mean=cellStats(d.GISS.E2.1.H, "mean")) %>% mutate("GCM" = "GISS.E2.1.H")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.INM.CM4.8<-INM.CM4.8[[12]]-ens_bio12_GCM
x.stats.15 <- data.frame(x.mean=cellStats(d.INM.CM4.8, "mean")) %>% mutate("GCM" = "INM.CM4.8")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.INM.CM5.0<-INM.CM5.0[[12]]-ens_bio12_GCM
x.stats.16 <- data.frame(x.mean=cellStats(d.INM.CM5.0, "mean")) %>% mutate("GCM" = "INM.CM5.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.IPSL.CM6A.LR<-IPSL.CM6A.LR[[12]]-ens_bio12_GCM
x.stats.17 <- data.frame(x.mean=cellStats(d.IPSL.CM6A.LR, "mean")) %>% mutate("GCM" = "IPSL.CM6A.LR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MIROC6<-MIROC6[[12]]-ens_bio12_GCM
x.stats.18 <- data.frame(x.mean=cellStats(d.MIROC6, "mean")) %>% mutate("GCM" = "MIROC6")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MIROC.ES2L<-MIROC.ES2L[[12]]-ens_bio12_GCM
x.stats.19 <- data.frame(x.mean=cellStats(d.MIROC.ES2L, "mean")) %>% mutate("GCM" = "MIROC.ES2L")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MPI.ESM1.2.HR<-MPI.ESM1.2.HR[[12]]-ens_bio12_GCM
x.stats.20 <- data.frame(x.mean=cellStats(d.MPI.ESM1.2.HR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2.HR")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MPI.ESM1.2.LR<-MPI.ESM1.2.LR[[12]]-ens_bio12_GCM
x.stats.21 <- data.frame(x.mean=cellStats(d.MPI.ESM1.2.LR, "mean")) %>% mutate("GCM" = "MPI.ESM1.2")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.MRI.ESM2.0<-MRI.ESM2.0[[12]]-ens_bio12_GCM
x.stats.22 <- data.frame(x.mean=cellStats(d.MRI.ESM2.0, "mean")) %>% mutate("GCM" = "MRI.ESM2.0")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.UKESM1.0.LL<-UKESM1.0.LL[[12]]-ens_bio12_GCM
x.stats.23 <- data.frame(x.mean=cellStats(d.UKESM1.0.LL, "mean")) %>% mutate("GCM" = "UKESM1.0.LL")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

d.HadGEM3.GC31.LL<-HadGEM3.GC31.LL[[12]]-ens_bio12_GCM
x.stats.24 <- data.frame(x.mean=cellStats(d.HadGEM3.GC31.LL, "mean")) %>% mutate("GCM" = "HadGEM3.GC31.LL")%>% mutate("Delta" = "Between GCM")%>% mutate("Variable"= "Bio12")

Bio12_between_GCM<-rbind(x.stats.0,x.stats.1, x.stats.2,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)#x.stats.3,

write.csv(Bio12_between_GCM, "C:/COBERTURAS/Bio12_between_GCM.csv")

rm(x.stats.1, x.stats.2,x.stats.3,x.stats.4,x.stats.5,x.stats.6,x.stats.7,x.stats.8,x.stats.9,x.stats.10,x.stats.11,x.stats.12,x.stats.13,x.stats.14,x.stats.15,x.stats.16,x.stats.17,x.stats.18,x.stats.19,x.stats.20,x.stats.21,x.stats.22,x.stats.23,x.stats.24)

rm(d.ACCESS.CM2,d.ACCESS.ESM1,d.BCC.CSM2.MR,d.CanESM5,d.CanESM5.CanOE,d.CMCC.ESM2,d.CNRM.CM6.1,d.CNRM.CM6.1.HR,d.CNRM.ESM2.1,d.EC.Earth3.Veg,d.EC.Earth3.Veg.LR,d.FIO.ESM.2.0,d.GISS.E2.1.G,d.GISS.E2.1.H,d.INM.CM4.8,d.INM.CM5.0,d.IPSL.CM6A.LR,d.MIROC6,d.MIROC.ES2L,d.MPI.ESM1.2.HR,d.MPI.ESM1.2.LR,d.MRI.ESM2.0,d.UKESM1.0.LL,d.HadGEM3.GC31.LL)

#####
Compare<-rbind(Bio12_between_GCM,Bio01_between_GCM)
View(Compare)

