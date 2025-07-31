module Acronym (abbreviate) where

import qualified Data.Text as T
import qualified Data.Char as Ch

abbreviate :: String -> String
abbreviate xs = T.unpack $ fst 
                $ T.foldl folderFunction initialAcc textToAbreviate
    where
        textToAbreviate = T.pack xs
        initialAcc = (T.empty, (True, True))   -- = (accText, (isPrevNonLetter, isPrevLower))
        isNotLetter ch = 
            (not $ Ch.isAlpha ch) 
            && (not $ ch == '\'')
        isNextAppend ch = (isNotLetter ch, Ch.isLower ch)
        confirmAppend ch (isPrevNonLetter, isPrevLower) = 
            (isPrevNonLetter && Ch.isAlpha ch) 
            || (isPrevLower && Ch.isUpper ch) 
        folderFunction (accText, appendFlag) char
            | confirmAppend char appendFlag = 
                (T.snoc accText (Ch.toUpper char), (False, False))
            | otherwise = (accText, isNextAppend char)

