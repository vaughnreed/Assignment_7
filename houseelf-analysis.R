#I have created this file.  This file will allow me to help with version control.  
houseelf_earlength_dna_data <- read.csv("./data/houseelf_earlength_dna_data_1.csv", header = TRUE)
elf_dna_gc_content <- function(sequence){
  g_elf <- str_count(str_to_upper(sequence), "G")
  c_elf <- str_count(str_to_upper(sequence), "C")
  gc_content <- (g_elf + c_elf) / str_length(sequence) * 100
  return(gc_content)
}
library(stringr)
sapply(houseelf_earlength_dna_data$dnaseq, elf_dna_gc_content)

get_size_class <- function(ear_length){
   # Calculate the size class for one or more earth lengths
   ear_lengths <- ifelse(ear_length > 10, "large", "small")
   return(ear_lengths)
}
df <- data.frame(ID=houseelf_earlength_dna_data$id, gc=NA, ear_length_class=NA)
for(i in 1:nrow(df)){
  df$gc= elf_dna_gc_content(houseelf_earlength_dna_data$dnaseq)
}
for(i in 1:nrow(df)){
  df$ear_length_class=get_size_class(houseelf_earlength_dna_data$earlength)
}
print(df)
