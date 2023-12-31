module Acronym (abbreviate) where

import qualified Data.Text as T
import qualified Data.Char as Ch

abbreviate :: String -> String
abbreviate xs = (getOnlyUppers . splitInWords) textToAbreviate 
    where 
        textToAbreviate = T.pack xs
        splitInWords text = 
            T.split (`elem`  " -_") text
        getOnlyUppers textList = 
            T.unpack $ T.concat $ map getLetters textList
        getLetters text
            | text == T.empty = text
            | T.all Ch.isUpper text = 
                T.singleton $ Ch.toUpper $ T.head text 
            | otherwise = 
                T.cons 
                    (Ch.toUpper $ T.head text) 
                    (T.filter Ch.isUpper (T.tail text))   
        