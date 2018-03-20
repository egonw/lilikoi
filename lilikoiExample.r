library(lilikoi)

data_dir=system.file("extdata", "plasma_breast_cancer.csv", package = "lilikoi")
plasma_data=read.csv(data_dir,check.names=F,row.names=1)
head(plasma_data)
dim(plasma_data)
table(plasma_data$Label)

metaboliteDataSet = Loaddata(file=system.file("extdata", "plasma_breast_cancer.csv", package = "lilikoi"))
head(metaboliteDataSet)

withPathways = metabolitesToPathways(metaboliteDataSet)
Metabolite_pathway_table=MetaTOpathway(metaboliteDataSet, 'name')
Metabolite_pathway_table=MetaTOpathway(metaboliteDataSet, 'name')
head(Metabolite_pathway_table)

PDSmatrix= PDSfun(Metabolite_pathway_table)

head(t(PDSmatrix))
dim(t(PDSmatrix))

selected_Pathways_Weka= featuresSelection(PDSmatrix,threshold= 0.54,method="gain")
selected_Pathways_Weka

result=machine_learning(PDSmatrix,selected_Pathways_Weka);

clinical_factors_data=read.csv(file=system.file("extdata", "plasma_breast_cancer_Meta.csv", package = "lilikoi"))
head(clinical_factors_data)
str(clinical_factors_data)

lilikoi::model_adjustment(result,PDSmatrix,selected_Pathways_Weka,clinical_factors_data,factors=c('Age','Race'))
