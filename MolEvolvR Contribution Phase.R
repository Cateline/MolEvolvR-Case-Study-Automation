# Install Bioconductor
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.19")
a
# Install Development Version of MolEvolvR
BiocManager::install("remotes")

BiocManager::install("JRaviLab/MolEvolvR")
a
library(MolEvolvR)
# List all available functions in MolEvolvR
ls("package:MolEvolvR")
library(rentrez)

# Retrieve the p53 and p63 protein sequences from UniProt
protein_ids <- c("P04637", "Q09973")  # UniProt IDs for human p53 and p63
sequences <- lapply(protein_ids, function(id) {
  entrez_fetch(db = "protein", id = id, rettype = "fasta")
})
# Save the sequences to a FASTA file
write(paste(sequences, collapse = "\n"), file = "p53_p63_sequences.fasta")

# Align the sequences
align_result <- MolEvolvR::alignFasta("p53_p63_sequences.fasta")
# Display the alignment result
print(align_result)

# List files in the current directory
list.files(pattern = "*.fa")
