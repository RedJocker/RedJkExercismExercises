module DNA (nucleotideCounts, Nucleotide(..)) where

import qualified Data.Map as Mp
import Data.Map (Map)
import Data.Foldable (foldrM)


data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = foldrM nucleotideMapper Mp.empty xs
    where 
        errorMessage = "Invalid nucleotide inputed"
        nucleotideMapper char acc = do
                        nucleotide  <- convertToNucleotide
                        return $ Mp.insertWith (+) nucleotide 1 acc 
            where
                convertToNucleotide = case char of
                    'A' ->  Right A
                    'C' ->  Right C
                    'G' ->  Right G
                    'T' ->  Right T
                    _ -> Left errorMessage
        