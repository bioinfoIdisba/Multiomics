library(readxl)

data_A<-read_excel("/home/josep/Baixades/Resultats proteòmica(1)/ANDREU/1-9_A1_A2_A3__precol2cm_col75cm_top15_70000_3e6_50_35000_5e4_100_iw4_excl40_2h_200nlmin_1ul_A1vsA2vsA3.xlsx")
data_C<-read_excel("/home/josep/Baixades/Resultats proteòmica(1)/ANDREU/10-14_C1_C2_C3__precol2cm_col75cm_top15_70000_3e6_50_35000_5e4_100_iw4_excl40_2h_200nlmin_1ul_C1vsC2vsC3.xlsx")

save(data_A,file ="/home/josep/Documents/01_IDISBA_2020/31_PROTEOMICA/multiomics_v2/data_A" )
save(data_C,file ="/home/josep/Documents/01_IDISBA_2020/31_PROTEOMICA/multiomics_v2/data_C" )

data_AC<-read_excel("/home/josep/Baixades/Resultats proteòmica(1)/ANDREU/1-14_A1_A2_A3_C1_C2_C3_precol2cm_col75cm_top15_70000_3e6_50_35000_5e4_100_iw4_excl40_2h_200nlmin_1ul_AvsC.xlsx")
pheno<-read_excel("./nomenclatura.xlsx")

## comparacio exceles ####
table(data_AC$Accession%in%data_A$Accession)
table(data_AC$Accession%in%data_C$Accession)


data_C_abundance<-data_C[,grep("Abundances [(]Grouped[)]:",colnames(data_C),ignore.case = T)]
data_C_abundance<-data.frame(data_C_abundance)
colnames(data_C_abundance)<-pheno$`Nomenclatura unificada`[4:6]
rownames(data_C_abundance)<-data_C$Accession

data_A_abundance<-data_A[,grep("Abundances [(]Grouped[)]:",colnames(data_A),ignore.case = T)]
data_A_abundance<-data.frame(data_A_abundance)
rownames(data_A_abundance)<-data_A$Accession


colnames(data_A_abundance)<-pheno$`Nomenclatura unificada`[1:3]


# Ven diagramm de comuns ####

# Matriu amb A i C junts ####
data_abundance<-merge(data_C_abundance,data_A_abundance,by="row.names",all=T)
data_abundance_0<-data_abundance

data_abundance_0[is.na(data_abundance_0)] <- 0
dir.create("./DATA_IN")
dir.create("./RESULTATS")
dir.create("./RESULTATS/OBJECTES")
save(data_abundance_0,file ="./RESULTATS/OBJECTES/data_abundance_0" )
save(data_abundance,file ="./RESULTATS/OBJECTES/data_abundance" )
colnames(data_abundance)

