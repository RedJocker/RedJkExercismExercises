module DNA (nucleotideCounts, Nucleotide(..)) where

import qualified Data.Map as Mp
import Data.Map (Map)
import Data.Foldable (foldrM)


data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = foldrM nucleotideMapper Mp.empty xs
    where 
        errorMessage = "Invalid nucleotide inputed"
        nucleotideMapper char acc = case char of
            'A' ->  insertNucleotide A
            'C' ->  insertNucleotide C
            'G' ->  insertNucleotide G
            'T' ->  insertNucleotide T
            _ -> Left errorMessage
            where
                insertNucleotide n = return $ Mp.insertWith (+) n 1 acc
        