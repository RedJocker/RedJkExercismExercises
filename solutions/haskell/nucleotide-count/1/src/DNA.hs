module DNA (nucleotideCounts, Nucleotide(..)) where

import qualified Data.Map as Mp
import Data.Map (Map)


data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = foldr folder (Right Mp.empty) xs
    where 
        errorMessage = "Invalid nucleotide inputed"
        folder _ (Left _) = Left errorMessage
        folder char (Right acc) = case char of
            'A' ->  insertNucleotide A
            'C' ->  insertNucleotide C
            'G' ->  insertNucleotide G
            'T' ->  insertNucleotide T
            _ -> Left errorMessage
            where
                insertNucleotide n = Right $ Mp.insertWith (+) n 1 acc
        