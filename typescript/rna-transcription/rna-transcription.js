const DNA_RNA_MAP = {
    "G": "C",
    "C": "G",
    "T": "A",
    "A": "U"
};
function panic(message) {
    throw Error(message);
}
export function toRna(dna) {
    return dna.split("")
        .map((nucleotide) => DNA_RNA_MAP[nucleotide] ?? panic("Invalid input DNA."))
        .join("");
}
