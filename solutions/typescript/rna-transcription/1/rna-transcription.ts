type NucleotideMap = {
  [nucleotide: string]: string
}

const DNA_RNA_MAP : NucleotideMap = {
  "G": "C",
  "C": "G",
  "T": "A",
  "A": "U"
}

function panic(message: string) {
  throw Error(message)
}

export function toRna(dna: string): string {
  return dna.split("")
    .map((nucleotide) => DNA_RNA_MAP[nucleotide] ?? panic("Invalid input DNA."))
    .join("")
}
